.class public Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# static fields
.field public static final p:I

.field public static final q:I

.field public static r:[[F


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:I

.field public d:Landroid/view/View;

.field public e:Landroidx/viewpager/widget/ViewPager;

.field public f:I

.field public final g:I

.field public final h:I

.field public final i:I

.field public j:I

.field public k:I

.field public l:Landroid/animation/AnimatorSet;

.field public m:Landroid/widget/LinearLayout;

.field public n:Z

.field public o:Landroid/database/DataSetObserver;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const/high16 v0, 0x40e00000    # 7.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->p:I

    .line 8
    .line 9
    const/high16 v0, 0x41000000    # 8.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->q:I

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    new-array v1, v0, [F

    .line 19
    .line 20
    fill-array-data v1, :array_0

    .line 21
    .line 22
    .line 23
    new-array v2, v0, [F

    .line 24
    .line 25
    fill-array-data v2, :array_1

    .line 26
    .line 27
    .line 28
    new-array v3, v0, [F

    .line 29
    .line 30
    fill-array-data v3, :array_2

    .line 31
    .line 32
    .line 33
    new-array v4, v0, [F

    .line 34
    .line 35
    fill-array-data v4, :array_3

    .line 36
    .line 37
    .line 38
    new-array v5, v0, [F

    .line 39
    .line 40
    fill-array-data v5, :array_4

    .line 41
    .line 42
    .line 43
    new-array v6, v0, [F

    .line 44
    .line 45
    fill-array-data v6, :array_5

    .line 46
    .line 47
    .line 48
    filled-new-array/range {v1 .. v6}, [[F

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sput-object v0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->r:[[F

    .line 53
    .line 54
    return-void

    .line 55
    :array_0
    .array-data 4
        0x0
        0x3f000000    # 0.5f
    .end array-data

    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    :array_1
    .array-data 4
        0x3f000000    # 0.5f
        0x3f400000    # 0.75f
    .end array-data

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    :array_2
    .array-data 4
        0x3f400000    # 0.75f
        0x3f800000    # 1.0f
    .end array-data

    .line 72
    .line 73
    .line 74
    .line 75
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x3f400000    # 0.75f
    .end array-data

    :array_4
    .array-data 4
        0x3f400000    # 0.75f
        0x3f000000    # 0.5f
    .end array-data

    :array_5
    .array-data 4
        0x3f000000    # 0.5f
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->b:I

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->d:Landroid/view/View;

    .line 18
    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f:I

    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g:I

    .line 23
    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->h:I

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->i:I

    .line 28
    .line 29
    const/high16 v0, 0x28000000

    .line 30
    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->j:I

    .line 32
    .line 33
    const/16 v0, -0x6cd5

    .line 34
    .line 35
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->k:I

    .line 36
    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->n:Z

    .line 38
    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 40
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    const/4 p1, 0x0

    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->b:I

    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    const/4 p2, 0x0

    .line 44
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->d:Landroid/view/View;

    .line 45
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f:I

    const/4 p2, -0x1

    .line 46
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g:I

    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->h:I

    const/4 p2, 0x1

    .line 48
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->i:I

    const/high16 p2, 0x28000000

    .line 49
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->j:I

    const/16 p2, -0x6cd5

    .line 50
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->k:I

    .line 51
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->n:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 52
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 53
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    const/4 p1, 0x0

    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->b:I

    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    const/4 p2, 0x0

    .line 56
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->d:Landroid/view/View;

    .line 57
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f:I

    const/4 p2, -0x1

    .line 58
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g:I

    .line 59
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->h:I

    const/4 p2, 0x1

    .line 60
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->i:I

    const/high16 p2, 0x28000000

    .line 61
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->j:I

    const/16 p2, -0x6cd5

    .line 62
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->k:I

    .line 63
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->n:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->j()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;)Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->m:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->h()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setColorByPosition(I)V

    return-void
.end method

.method public static bridge synthetic f()[[F
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->r:[[F

    return-object v0
.end method

.method private h()V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->n:Z

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    new-instance v0, Ll/zyk0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/zyk0;-><init>(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const/4 v2, -0x2

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 31
    .line 32
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 33
    .line 34
    .line 35
    :cond_1
    sget v3, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->p:I

    .line 36
    .line 37
    mul-int/lit8 v4, v3, 0x7

    .line 38
    .line 39
    sget v5, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->q:I

    .line 40
    .line 41
    mul-int/lit8 v6, v5, 0x6

    .line 42
    .line 43
    add-int/2addr v4, v6

    .line 44
    iput v4, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 45
    .line 46
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    new-instance v1, Landroid/widget/LinearLayout;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-direct {v1, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->m:Landroid/widget/LinearLayout;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->m:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    const/4 v4, 0x0

    .line 66
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 67
    .line 68
    .line 69
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 70
    .line 71
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 72
    .line 73
    .line 74
    mul-int/lit8 v2, v3, 0x9

    .line 75
    .line 76
    mul-int/lit8 v6, v5, 0x8

    .line 77
    .line 78
    add-int/2addr v2, v6

    .line 79
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 80
    .line 81
    const/16 v2, 0x11

    .line 82
    .line 83
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 84
    .line 85
    neg-int v2, v3

    .line 86
    sub-int/2addr v2, v5

    .line 87
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 88
    .line 89
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->m:Landroid/widget/LinearLayout;

    .line 90
    .line 91
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    .line 93
    .line 94
    :goto_0
    const/16 v2, 0x9

    .line 95
    .line 96
    if-ge v4, v2, :cond_2

    .line 97
    .line 98
    new-instance v2, Landroid/view/View;

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-direct {v2, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 105
    .line 106
    .line 107
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->j:I

    .line 108
    .line 109
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->k(Landroid/view/View;I)V

    .line 110
    .line 111
    .line 112
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 113
    .line 114
    sget v5, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->p:I

    .line 115
    .line 116
    invoke-direct {v3, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 117
    .line 118
    .line 119
    sget v5, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->q:I

    .line 120
    .line 121
    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 122
    .line 123
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->m:Landroid/widget/LinearLayout;

    .line 124
    .line 125
    invoke-virtual {v5, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 126
    .line 127
    .line 128
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 129
    .line 130
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    add-int/lit8 v4, v4, 0x1

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->m:Landroid/widget/LinearLayout;

    .line 137
    .line 138
    invoke-virtual {p0, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->i()V

    .line 142
    .line 143
    .line 144
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setColorByPosition(I)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method private synthetic j()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->n:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private setColorByPosition(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->d:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->j:I

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->k(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Landroid/view/View;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->d:Landroid/view/View;

    .line 19
    .line 20
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->k:I

    .line 21
    .line 22
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->k(Landroid/view/View;I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;IZZ)Landroid/animation/Animator;
    .locals 2

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    const/4 p4, 0x2

    .line 4
    new-array p4, p4, [F

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aput v1, p4, v0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->r:[[F

    .line 14
    .line 15
    aget-object v0, v0, p2

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    aget v0, v0, v1

    .line 19
    .line 20
    aput v0, p4, v1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget-object p4, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->r:[[F

    .line 24
    .line 25
    aget-object p4, p4, p2

    .line 26
    .line 27
    :goto_0
    const-string v0, "scaleX"

    .line 28
    .line 29
    invoke-static {v0, p4}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "scaleY"

    .line 34
    .line 35
    invoke-static {v1, p4}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 36
    .line 37
    .line 38
    move-result-object p4

    .line 39
    filled-new-array {v0, p4}, [Landroid/animation/PropertyValuesHolder;

    .line 40
    .line 41
    .line 42
    move-result-object p4

    .line 43
    invoke-static {p1, p4}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object p4

    .line 47
    new-instance v0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$b;

    .line 48
    .line 49
    invoke-direct {v0, p0, p3, p1, p2}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$b;-><init>(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;ZLandroid/view/View;I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p4, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 53
    .line 54
    .line 55
    const-wide/16 p0, 0xc8

    .line 56
    .line 57
    invoke-virtual {p4, p0, p1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 58
    .line 59
    .line 60
    return-object p4
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, -0x2

    .line 8
    .line 9
    if-gez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    :cond_0
    return p0
.end method

.method public final i()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f:I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->e:Landroidx/viewpager/widget/ViewPager;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/cf60;->getCount()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    add-int/lit8 v1, v1, -0x7

    .line 15
    .line 16
    const/4 v2, 0x3

    .line 17
    const/4 v3, 0x2

    .line 18
    const/4 v4, 0x1

    .line 19
    if-lt v1, v4, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    sub-int/2addr v5, v3

    .line 28
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroid/view/View;

    .line 33
    .line 34
    sget-object v5, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->r:[[F

    .line 35
    .line 36
    aget-object v5, v5, v4

    .line 37
    .line 38
    aget v5, v5, v0

    .line 39
    .line 40
    invoke-virtual {v1, v5}, Landroid/view/View;->setScaleX(F)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    sub-int/2addr v5, v3

    .line 50
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Landroid/view/View;

    .line 55
    .line 56
    sget-object v5, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->r:[[F

    .line 57
    .line 58
    aget-object v5, v5, v4

    .line 59
    .line 60
    aget v5, v5, v0

    .line 61
    .line 62
    invoke-virtual {v1, v5}, Landroid/view/View;->setScaleY(F)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    sub-int/2addr v5, v2

    .line 72
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Landroid/view/View;

    .line 77
    .line 78
    sget-object v5, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->r:[[F

    .line 79
    .line 80
    aget-object v5, v5, v3

    .line 81
    .line 82
    aget v5, v5, v0

    .line 83
    .line 84
    invoke-virtual {v1, v5}, Landroid/view/View;->setScaleX(F)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    sub-int/2addr v5, v2

    .line 94
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    check-cast v1, Landroid/view/View;

    .line 99
    .line 100
    sget-object v5, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->r:[[F

    .line 101
    .line 102
    aget-object v5, v5, v3

    .line 103
    .line 104
    aget v5, v5, v0

    .line 105
    .line 106
    invoke-virtual {v1, v5}, Landroid/view/View;->setScaleY(F)V

    .line 107
    .line 108
    .line 109
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    check-cast v1, Landroid/view/View;

    .line 116
    .line 117
    sget-object v5, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->r:[[F

    .line 118
    .line 119
    aget-object v5, v5, v2

    .line 120
    .line 121
    aget v5, v5, v0

    .line 122
    .line 123
    invoke-virtual {v1, v5}, Landroid/view/View;->setScaleX(F)V

    .line 124
    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 127
    .line 128
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    check-cast v1, Landroid/view/View;

    .line 133
    .line 134
    sget-object v4, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->r:[[F

    .line 135
    .line 136
    aget-object v4, v4, v2

    .line 137
    .line 138
    aget v4, v4, v0

    .line 139
    .line 140
    invoke-virtual {v1, v4}, Landroid/view/View;->setScaleY(F)V

    .line 141
    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 144
    .line 145
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    check-cast v1, Landroid/view/View;

    .line 150
    .line 151
    sget-object v4, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->r:[[F

    .line 152
    .line 153
    aget-object v4, v4, v2

    .line 154
    .line 155
    aget v4, v4, v0

    .line 156
    .line 157
    invoke-virtual {v1, v4}, Landroid/view/View;->setScaleX(F)V

    .line 158
    .line 159
    .line 160
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 161
    .line 162
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    check-cast p0, Landroid/view/View;

    .line 167
    .line 168
    sget-object v1, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->r:[[F

    .line 169
    .line 170
    aget-object v1, v1, v2

    .line 171
    .line 172
    aget v0, v1, v0

    .line 173
    .line 174
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public final k(Landroid/view/View;I)V
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v0, 0x40e00000    # 7.0f

    .line 7
    .line 8
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v0, v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final l(ZLandroid/animation/Animator$AnimatorListener;)V
    .locals 9

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->l:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->l:Landroid/animation/AnimatorSet;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 19
    .line 20
    .line 21
    :cond_0
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 22
    .line 23
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->l:Landroid/animation/AnimatorSet;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    const/4 v2, 0x2

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    move p1, v2

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    move p1, v1

    .line 35
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->e:Landroidx/viewpager/widget/ViewPager;

    .line 36
    .line 37
    invoke-virtual {v3}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Ll/cf60;->getCount()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f:I

    .line 46
    .line 47
    add-int/lit8 v4, v4, 0x7

    .line 48
    .line 49
    sub-int/2addr v3, v4

    .line 50
    const/4 v4, 0x5

    .line 51
    const/4 v5, 0x4

    .line 52
    const/4 v6, 0x3

    .line 53
    const/4 v7, 0x1

    .line 54
    if-lt v3, v7, :cond_3

    .line 55
    .line 56
    and-int/lit8 v3, p1, 0x2

    .line 57
    .line 58
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 59
    .line 60
    if-ne v3, v2, :cond_2

    .line 61
    .line 62
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    sub-int/2addr v3, v2

    .line 67
    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    check-cast v3, Landroid/view/View;

    .line 72
    .line 73
    invoke-virtual {p0, v3, v4, v7, v7}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    sub-int/2addr v8, v6

    .line 87
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Landroid/view/View;

    .line 92
    .line 93
    invoke-virtual {p0, v3, v5, v7, v7}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result v8

    .line 106
    sub-int/2addr v8, v5

    .line 107
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    check-cast v3, Landroid/view/View;

    .line 112
    .line 113
    invoke-virtual {p0, v3, v6, v7, v7}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    goto/16 :goto_1

    .line 121
    .line 122
    :cond_2
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    sub-int/2addr v3, v7

    .line 127
    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    check-cast v3, Landroid/view/View;

    .line 132
    .line 133
    invoke-virtual {p0, v3, v1, v7, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 141
    .line 142
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 143
    .line 144
    .line 145
    move-result v8

    .line 146
    sub-int/2addr v8, v2

    .line 147
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    check-cast v3, Landroid/view/View;

    .line 152
    .line 153
    invoke-virtual {p0, v3, v7, v7, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 161
    .line 162
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 163
    .line 164
    .line 165
    move-result v8

    .line 166
    sub-int/2addr v8, v6

    .line 167
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    check-cast v3, Landroid/view/View;

    .line 172
    .line 173
    invoke-virtual {p0, v3, v2, v7, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_3
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->e:Landroidx/viewpager/widget/ViewPager;

    .line 182
    .line 183
    invoke-virtual {v3}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    invoke-virtual {v3}, Ll/cf60;->getCount()I

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    iget v8, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f:I

    .line 192
    .line 193
    add-int/lit8 v8, v8, 0x7

    .line 194
    .line 195
    sub-int/2addr v3, v8

    .line 196
    if-nez v3, :cond_4

    .line 197
    .line 198
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 199
    .line 200
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 201
    .line 202
    .line 203
    move-result v8

    .line 204
    sub-int/2addr v8, v7

    .line 205
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    check-cast v3, Landroid/view/View;

    .line 210
    .line 211
    invoke-virtual {p0, v3, v2, v1, v7}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 219
    .line 220
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 221
    .line 222
    .line 223
    move-result v8

    .line 224
    sub-int/2addr v8, v2

    .line 225
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    check-cast v3, Landroid/view/View;

    .line 230
    .line 231
    invoke-virtual {p0, v3, v2, v1, v7}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 239
    .line 240
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 241
    .line 242
    .line 243
    move-result v8

    .line 244
    sub-int/2addr v8, v6

    .line 245
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v3

    .line 249
    check-cast v3, Landroid/view/View;

    .line 250
    .line 251
    invoke-virtual {p0, v3, v2, v1, v7}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    or-int/lit8 p1, p1, 0x4

    .line 259
    .line 260
    :cond_4
    :goto_1
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f:I

    .line 261
    .line 262
    if-ne v3, v7, :cond_6

    .line 263
    .line 264
    and-int/lit8 v3, p1, 0x2

    .line 265
    .line 266
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 267
    .line 268
    if-ne v3, v2, :cond_5

    .line 269
    .line 270
    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v3

    .line 274
    check-cast v3, Landroid/view/View;

    .line 275
    .line 276
    invoke-virtual {p0, v3, v1, v7, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 277
    .line 278
    .line 279
    move-result-object v3

    .line 280
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 284
    .line 285
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object v3

    .line 289
    check-cast v3, Landroid/view/View;

    .line 290
    .line 291
    invoke-virtual {p0, v3, v7, v7, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 292
    .line 293
    .line 294
    move-result-object v3

    .line 295
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 299
    .line 300
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    check-cast v3, Landroid/view/View;

    .line 305
    .line 306
    invoke-virtual {p0, v3, v2, v7, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 307
    .line 308
    .line 309
    move-result-object v3

    .line 310
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 311
    .line 312
    .line 313
    goto/16 :goto_2

    .line 314
    .line 315
    :cond_5
    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object v3

    .line 319
    check-cast v3, Landroid/view/View;

    .line 320
    .line 321
    invoke-virtual {p0, v3, v4, v7, v7}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 322
    .line 323
    .line 324
    move-result-object v3

    .line 325
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 329
    .line 330
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object v3

    .line 334
    check-cast v3, Landroid/view/View;

    .line 335
    .line 336
    invoke-virtual {p0, v3, v5, v7, v7}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 337
    .line 338
    .line 339
    move-result-object v3

    .line 340
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 344
    .line 345
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    move-result-object v3

    .line 349
    check-cast v3, Landroid/view/View;

    .line 350
    .line 351
    invoke-virtual {p0, v3, v6, v7, v7}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 352
    .line 353
    .line 354
    move-result-object v3

    .line 355
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    goto/16 :goto_2

    .line 359
    .line 360
    :cond_6
    if-le v3, v7, :cond_8

    .line 361
    .line 362
    and-int/lit8 v3, p1, 0x2

    .line 363
    .line 364
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 365
    .line 366
    if-ne v3, v2, :cond_7

    .line 367
    .line 368
    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 369
    .line 370
    .line 371
    move-result-object v3

    .line 372
    check-cast v3, Landroid/view/View;

    .line 373
    .line 374
    invoke-virtual {p0, v3, v1, v7, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 375
    .line 376
    .line 377
    move-result-object v3

    .line 378
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 382
    .line 383
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object v3

    .line 387
    check-cast v3, Landroid/view/View;

    .line 388
    .line 389
    invoke-virtual {p0, v3, v7, v7, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 390
    .line 391
    .line 392
    move-result-object v3

    .line 393
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 394
    .line 395
    .line 396
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 397
    .line 398
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 399
    .line 400
    .line 401
    move-result-object v3

    .line 402
    check-cast v3, Landroid/view/View;

    .line 403
    .line 404
    invoke-virtual {p0, v3, v2, v7, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 405
    .line 406
    .line 407
    move-result-object v3

    .line 408
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 409
    .line 410
    .line 411
    goto :goto_2

    .line 412
    :cond_7
    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 413
    .line 414
    .line 415
    move-result-object v3

    .line 416
    check-cast v3, Landroid/view/View;

    .line 417
    .line 418
    invoke-virtual {p0, v3, v4, v7, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 419
    .line 420
    .line 421
    move-result-object v3

    .line 422
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 423
    .line 424
    .line 425
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 426
    .line 427
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object v3

    .line 431
    check-cast v3, Landroid/view/View;

    .line 432
    .line 433
    invoke-virtual {p0, v3, v5, v7, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 434
    .line 435
    .line 436
    move-result-object v3

    .line 437
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 438
    .line 439
    .line 440
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 441
    .line 442
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 443
    .line 444
    .line 445
    move-result-object v3

    .line 446
    check-cast v3, Landroid/view/View;

    .line 447
    .line 448
    invoke-virtual {p0, v3, v6, v7, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 449
    .line 450
    .line 451
    move-result-object v3

    .line 452
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 453
    .line 454
    .line 455
    goto :goto_2

    .line 456
    :cond_8
    if-nez v3, :cond_9

    .line 457
    .line 458
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 459
    .line 460
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 461
    .line 462
    .line 463
    move-result-object v3

    .line 464
    check-cast v3, Landroid/view/View;

    .line 465
    .line 466
    invoke-virtual {p0, v3, v2, v1, v7}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 467
    .line 468
    .line 469
    move-result-object v3

    .line 470
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 471
    .line 472
    .line 473
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 474
    .line 475
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 476
    .line 477
    .line 478
    move-result-object v3

    .line 479
    check-cast v3, Landroid/view/View;

    .line 480
    .line 481
    invoke-virtual {p0, v3, v2, v1, v7}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 482
    .line 483
    .line 484
    move-result-object v3

    .line 485
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 486
    .line 487
    .line 488
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->a:Ljava/util/List;

    .line 489
    .line 490
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    move-result-object v3

    .line 494
    check-cast v3, Landroid/view/View;

    .line 495
    .line 496
    invoke-virtual {p0, v3, v2, v1, v7}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;

    .line 497
    .line 498
    .line 499
    move-result-object v3

    .line 500
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 501
    .line 502
    .line 503
    or-int/lit8 p1, p1, 0x4

    .line 504
    .line 505
    :cond_9
    :goto_2
    sget v3, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->p:I

    .line 506
    .line 507
    sget v4, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->q:I

    .line 508
    .line 509
    add-int/2addr v3, v4

    .line 510
    and-int/2addr p1, v2

    .line 511
    if-nez p1, :cond_a

    .line 512
    .line 513
    mul-int/lit8 v3, v3, -0x1

    .line 514
    .line 515
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->m:Landroid/widget/LinearLayout;

    .line 516
    .line 517
    int-to-float v3, v3

    .line 518
    new-array v2, v2, [F

    .line 519
    .line 520
    const/4 v4, 0x0

    .line 521
    aput v4, v2, v1

    .line 522
    .line 523
    aput v3, v2, v7

    .line 524
    .line 525
    const-string v1, "translationX"

    .line 526
    .line 527
    invoke-static {p1, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 528
    .line 529
    .line 530
    move-result-object p1

    .line 531
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 532
    .line 533
    .line 534
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 535
    .line 536
    .line 537
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->l:Landroid/animation/AnimatorSet;

    .line 538
    .line 539
    const-wide/16 v1, 0xc8

    .line 540
    .line 541
    invoke-virtual {p1, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 542
    .line 543
    .line 544
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->l:Landroid/animation/AnimatorSet;

    .line 545
    .line 546
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 547
    .line 548
    .line 549
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->l:Landroid/animation/AnimatorSet;

    .line 550
    .line 551
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 552
    .line 553
    .line 554
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->getCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    const/4 v2, 0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->b:I

    .line 11
    .line 12
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    sub-int/2addr v4, p1

    .line 17
    if-le v4, v2, :cond_0

    .line 18
    .line 19
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    .line 20
    .line 21
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f:I

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->i()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->b:I

    .line 28
    .line 29
    const/4 v5, 0x2

    .line 30
    if-ge v4, p1, :cond_2

    .line 31
    .line 32
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    .line 33
    .line 34
    add-int/lit8 v0, v0, -0x3

    .line 35
    .line 36
    if-ne v4, v0, :cond_1

    .line 37
    .line 38
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->e:Landroidx/viewpager/widget/ViewPager;

    .line 39
    .line 40
    invoke-virtual {v4}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v4}, Ll/cf60;->getCount()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    sub-int/2addr v4, v5

    .line 49
    if-ge p1, v4, :cond_1

    .line 50
    .line 51
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    .line 52
    .line 53
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f:I

    .line 54
    .line 55
    add-int/2addr v0, v2

    .line 56
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f:I

    .line 57
    .line 58
    move v0, v2

    .line 59
    goto :goto_1

    .line 60
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    .line 61
    .line 62
    add-int/2addr v0, v2

    .line 63
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    if-le v4, p1, :cond_4

    .line 67
    .line 68
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    .line 69
    .line 70
    if-ne v0, v5, :cond_3

    .line 71
    .line 72
    if-lt p1, v5, :cond_3

    .line 73
    .line 74
    iput v5, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    .line 75
    .line 76
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f:I

    .line 77
    .line 78
    sub-int/2addr v0, v2

    .line 79
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f:I

    .line 80
    .line 81
    move v0, v1

    .line 82
    goto :goto_1

    .line 83
    :cond_3
    sub-int/2addr v0, v2

    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    .line 85
    .line 86
    :cond_4
    :goto_0
    move v0, v3

    .line 87
    :goto_1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->b:I

    .line 88
    .line 89
    if-eqz v0, :cond_7

    .line 90
    .line 91
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    .line 92
    .line 93
    if-ne v0, v1, :cond_5

    .line 94
    .line 95
    sub-int/2addr p1, v2

    .line 96
    goto :goto_2

    .line 97
    :cond_5
    add-int/2addr p1, v2

    .line 98
    :goto_2
    add-int/2addr p1, v2

    .line 99
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setColorByPosition(I)V

    .line 100
    .line 101
    .line 102
    if-ne v0, v1, :cond_6

    .line 103
    .line 104
    goto :goto_3

    .line 105
    :cond_6
    move v2, v3

    .line 106
    :goto_3
    new-instance p1, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$a;

    .line 107
    .line 108
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$a;-><init>(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0, v2, p1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->l(ZLandroid/animation/Animator$AnimatorListener;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_7
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c:I

    .line 116
    .line 117
    add-int/2addr p1, v2

    .line 118
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setColorByPosition(I)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public setNormalColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->j:I

    .line 2
    .line 3
    return-void
.end method

.method public setSelectedColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->k:I

    .line 2
    .line 3
    return-void
.end method

.method public setViewPager(Landroidx/viewpager/widget/ViewPager;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->e:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->P(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 9
    .line 10
    .line 11
    :cond_1
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->e:Landroidx/viewpager/widget/ViewPager;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->o:Landroid/database/DataSetObserver;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    new-instance p1, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$c;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$c;-><init>(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->o:Landroid/database/DataSetObserver;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->o:Landroid/database/DataSetObserver;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ll/cf60;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 38
    .line 39
    .line 40
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->e:Landroidx/viewpager/widget/ViewPager;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->o:Landroid/database/DataSetObserver;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ll/cf60;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->e:Landroidx/viewpager/widget/ViewPager;

    .line 52
    .line 53
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    const-string p0, "ViewPager does not have adapter instance."

    .line 61
    .line 62
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
