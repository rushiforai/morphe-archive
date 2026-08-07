.class public Landroidx/constraintlayout/widget/ConstraintLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/widget/ConstraintLayout$a;
    }
.end annotation


# static fields
.field static final ALLOWS_EMBEDDED:Z = false

.field private static final CACHE_MEASURED_DIMENSION:Z = false

.field private static final DEBUG:Z = false

.field public static final DESIGN_INFO_ID:I = 0x0

.field private static final TAG:Ljava/lang/String; = "ConstraintLayout"

.field private static final USE_CONSTRAINTS_HELPER:Z = true

.field public static final VERSION:Ljava/lang/String; = "ConstraintLayout-1.1.3"


# instance fields
.field mChildrenByIds:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mConstraintHelpers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/widget/ConstraintHelper;",
            ">;"
        }
    .end annotation
.end field

.field private mConstraintSet:Landroidx/constraintlayout/widget/a;

.field private mConstraintSetId:I

.field private mDesignIds:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mDirtyHierarchy:Z

.field private mLastMeasureHeight:I

.field mLastMeasureHeightMode:I

.field mLastMeasureHeightSize:I

.field private mLastMeasureWidth:I

.field mLastMeasureWidthMode:I

.field mLastMeasureWidthSize:I

.field mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

.field private mMaxHeight:I

.field private mMaxWidth:I

.field private mMetrics:Ll/pa00;

.field private mMinHeight:I

.field private mMinWidth:I

.field private mOptimizationLevel:I

.field private final mVariableDimensionsWidgets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/solver/widgets/ConstraintWidget;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    const/4 v0, 0x4

    .line 14
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    const/16 v0, 0x64

    .line 22
    .line 23
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    .line 27
    .line 28
    new-instance p1, Landroidx/constraintlayout/solver/widgets/e;

    .line 29
    .line 30
    invoke-direct {p1}, Landroidx/constraintlayout/solver/widgets/e;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 37
    .line 38
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    .line 39
    .line 40
    const v0, 0x7fffffff

    .line 41
    .line 42
    .line 43
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 44
    .line 45
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    .line 49
    .line 50
    const/4 v0, 0x7

    .line 51
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/a;

    .line 55
    .line 56
    const/4 v1, -0x1

    .line 57
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    .line 58
    .line 59
    new-instance v2, Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 65
    .line 66
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidth:I

    .line 67
    .line 68
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeight:I

    .line 69
    .line 70
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidthSize:I

    .line 71
    .line 72
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeightSize:I

    .line 73
    .line 74
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidthMode:I

    .line 75
    .line 76
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeightMode:I

    .line 77
    .line 78
    invoke-direct {p0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->init(Landroid/util/AttributeSet;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 82
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 83
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 84
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 85
    new-instance p1, Ljava/util/ArrayList;

    const/16 v0, 0x64

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    .line 86
    new-instance p1, Landroidx/constraintlayout/solver/widgets/e;

    invoke-direct {p1}, Landroidx/constraintlayout/solver/widgets/e;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    const/4 p1, 0x0

    .line 87
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 88
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    const v0, 0x7fffffff

    .line 89
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 90
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    const/4 v0, 0x1

    .line 91
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    const/4 v0, 0x7

    .line 92
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    const/4 v0, 0x0

    .line 93
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/a;

    const/4 v0, -0x1

    .line 94
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    .line 95
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 96
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidth:I

    .line 97
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeight:I

    .line 98
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidthSize:I

    .line 99
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeightSize:I

    .line 100
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidthMode:I

    .line 101
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeightMode:I

    .line 102
    invoke-direct {p0, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->init(Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 103
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 104
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 105
    new-instance p1, Ljava/util/ArrayList;

    const/4 p3, 0x4

    invoke-direct {p1, p3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 106
    new-instance p1, Ljava/util/ArrayList;

    const/16 p3, 0x64

    invoke-direct {p1, p3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    .line 107
    new-instance p1, Landroidx/constraintlayout/solver/widgets/e;

    invoke-direct {p1}, Landroidx/constraintlayout/solver/widgets/e;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    const/4 p1, 0x0

    .line 108
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 109
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    const p3, 0x7fffffff

    .line 110
    iput p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 111
    iput p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    const/4 p3, 0x1

    .line 112
    iput-boolean p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    const/4 p3, 0x7

    .line 113
    iput p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    const/4 p3, 0x0

    .line 114
    iput-object p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/a;

    const/4 p3, -0x1

    .line 115
    iput p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    .line 116
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 117
    iput p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidth:I

    .line 118
    iput p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeight:I

    .line 119
    iput p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidthSize:I

    .line 120
    iput p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeightSize:I

    .line 121
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidthMode:I

    .line 122
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeightMode:I

    .line 123
    invoke-direct {p0, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->init(Landroid/util/AttributeSet;)V

    return-void
.end method

.method private final getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/view/View;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    if-eq v0, p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-ne p1, p0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->onViewAdded(Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    if-ne v0, p0, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    if-nez v0, :cond_3

    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return-object p0

    .line 42
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 47
    .line 48
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->l0:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 49
    .line 50
    return-object p0
.end method

.method private init(Landroid/util/AttributeSet;)V
    .locals 7

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/a;

    .line 17
    .line 18
    if-eqz p1, :cond_7

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Ll/qhc0;->a:[I

    .line 25
    .line 26
    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/4 v2, 0x0

    .line 35
    move v3, v2

    .line 36
    :goto_0
    if-ge v3, v1, :cond_6

    .line 37
    .line 38
    invoke-virtual {p1, v3}, Landroid/content/res/TypedArray;->getIndex(I)I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    sget v5, Ll/qhc0;->e:I

    .line 43
    .line 44
    if-ne v4, v5, :cond_0

    .line 45
    .line 46
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 47
    .line 48
    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_0
    sget v5, Ll/qhc0;->f:I

    .line 56
    .line 57
    if-ne v4, v5, :cond_1

    .line 58
    .line 59
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    .line 60
    .line 61
    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_1
    sget v5, Ll/qhc0;->c:I

    .line 69
    .line 70
    if-ne v4, v5, :cond_2

    .line 71
    .line 72
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 73
    .line 74
    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_2
    sget v5, Ll/qhc0;->d:I

    .line 82
    .line 83
    if-ne v4, v5, :cond_3

    .line 84
    .line 85
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    .line 86
    .line 87
    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_3
    sget v5, Ll/qhc0;->h0:I

    .line 95
    .line 96
    if-ne v4, v5, :cond_4

    .line 97
    .line 98
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    .line 99
    .line 100
    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_4
    sget v5, Ll/qhc0;->i:I

    .line 108
    .line 109
    if-ne v4, v5, :cond_5

    .line 110
    .line 111
    invoke-virtual {p1, v4, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    :try_start_0
    new-instance v5, Landroidx/constraintlayout/widget/a;

    .line 116
    .line 117
    invoke-direct {v5}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 118
    .line 119
    .line 120
    iput-object v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/a;

    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 123
    .line 124
    .line 125
    move-result-object v6

    .line 126
    invoke-virtual {v5, v6, v4}, Landroidx/constraintlayout/widget/a;->n(Landroid/content/Context;I)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .line 128
    .line 129
    goto :goto_1

    .line 130
    :catch_0
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/a;

    .line 131
    .line 132
    :goto_1
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    .line 133
    .line 134
    :cond_5
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_6
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 138
    .line 139
    .line 140
    :cond_7
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 141
    .line 142
    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    .line 143
    .line 144
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/solver/widgets/e;->d1(I)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method private internalMeasureChildren(II)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    add-int/2addr v3, v4

    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    add-int/2addr v4, v5

    .line 25
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    const/4 v7, 0x0

    .line 30
    :goto_0
    if-ge v7, v5, :cond_12

    .line 31
    .line 32
    invoke-virtual {v0, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v8

    .line 36
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    .line 37
    .line 38
    .line 39
    move-result v9

    .line 40
    const/16 v10, 0x8

    .line 41
    .line 42
    if-ne v9, v10, :cond_0

    .line 43
    .line 44
    goto/16 :goto_a

    .line 45
    .line 46
    :cond_0
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 47
    .line 48
    .line 49
    move-result-object v9

    .line 50
    check-cast v9, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 51
    .line 52
    iget-object v10, v9, Landroidx/constraintlayout/widget/ConstraintLayout$a;->l0:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 53
    .line 54
    iget-boolean v11, v9, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Y:Z

    .line 55
    .line 56
    if-nez v11, :cond_11

    .line 57
    .line 58
    iget-boolean v11, v9, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Z:Z

    .line 59
    .line 60
    if-eqz v11, :cond_1

    .line 61
    .line 62
    goto/16 :goto_a

    .line 63
    .line 64
    :cond_1
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    .line 65
    .line 66
    .line 67
    move-result v11

    .line 68
    invoke-virtual {v10, v11}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x0(I)V

    .line 69
    .line 70
    .line 71
    iget v11, v9, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 72
    .line 73
    iget v12, v9, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 74
    .line 75
    iget-boolean v13, v9, Landroidx/constraintlayout/widget/ConstraintLayout$a;->V:Z

    .line 76
    .line 77
    const/4 v14, -0x1

    .line 78
    const/4 v15, 0x1

    .line 79
    if-nez v13, :cond_4

    .line 80
    .line 81
    iget-boolean v6, v9, Landroidx/constraintlayout/widget/ConstraintLayout$a;->W:Z

    .line 82
    .line 83
    if-nez v6, :cond_4

    .line 84
    .line 85
    if-nez v13, :cond_2

    .line 86
    .line 87
    iget v13, v9, Landroidx/constraintlayout/widget/ConstraintLayout$a;->I:I

    .line 88
    .line 89
    if-eq v13, v15, :cond_4

    .line 90
    .line 91
    :cond_2
    if-eq v11, v14, :cond_4

    .line 92
    .line 93
    if-nez v6, :cond_3

    .line 94
    .line 95
    iget v6, v9, Landroidx/constraintlayout/widget/ConstraintLayout$a;->J:I

    .line 96
    .line 97
    if-eq v6, v15, :cond_4

    .line 98
    .line 99
    if-ne v12, v14, :cond_3

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_3
    const/4 v6, 0x0

    .line 103
    goto :goto_2

    .line 104
    :cond_4
    :goto_1
    move v6, v15

    .line 105
    :goto_2
    if-eqz v6, :cond_e

    .line 106
    .line 107
    const/4 v6, -0x2

    .line 108
    if-nez v11, :cond_5

    .line 109
    .line 110
    invoke-static {v1, v4, v6}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 111
    .line 112
    .line 113
    move-result v13

    .line 114
    move/from16 v16, v15

    .line 115
    .line 116
    goto :goto_4

    .line 117
    :cond_5
    if-ne v11, v14, :cond_6

    .line 118
    .line 119
    invoke-static {v1, v4, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 120
    .line 121
    .line 122
    move-result v13

    .line 123
    const/16 v16, 0x0

    .line 124
    .line 125
    goto :goto_4

    .line 126
    :cond_6
    if-ne v11, v6, :cond_7

    .line 127
    .line 128
    move v13, v15

    .line 129
    goto :goto_3

    .line 130
    :cond_7
    const/4 v13, 0x0

    .line 131
    :goto_3
    invoke-static {v1, v4, v11}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 132
    .line 133
    .line 134
    move-result v16

    .line 135
    move/from16 v21, v16

    .line 136
    .line 137
    move/from16 v16, v13

    .line 138
    .line 139
    move/from16 v13, v21

    .line 140
    .line 141
    :goto_4
    if-nez v12, :cond_8

    .line 142
    .line 143
    invoke-static {v2, v3, v6}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 144
    .line 145
    .line 146
    move-result v17

    .line 147
    move/from16 v21, v17

    .line 148
    .line 149
    move/from16 v17, v15

    .line 150
    .line 151
    move/from16 v15, v21

    .line 152
    .line 153
    goto :goto_6

    .line 154
    :cond_8
    if-ne v12, v14, :cond_9

    .line 155
    .line 156
    invoke-static {v2, v3, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 157
    .line 158
    .line 159
    move-result v17

    .line 160
    move/from16 v15, v17

    .line 161
    .line 162
    const/16 v17, 0x0

    .line 163
    .line 164
    goto :goto_6

    .line 165
    :cond_9
    if-ne v12, v6, :cond_a

    .line 166
    .line 167
    move/from16 v17, v15

    .line 168
    .line 169
    goto :goto_5

    .line 170
    :cond_a
    const/16 v17, 0x0

    .line 171
    .line 172
    :goto_5
    invoke-static {v2, v3, v12}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 173
    .line 174
    .line 175
    move-result v18

    .line 176
    move/from16 v15, v18

    .line 177
    .line 178
    :goto_6
    invoke-virtual {v8, v13, v15}, Landroid/view/View;->measure(II)V

    .line 179
    .line 180
    .line 181
    iget-object v13, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMetrics:Ll/pa00;

    .line 182
    .line 183
    if-eqz v13, :cond_b

    .line 184
    .line 185
    iget-wide v14, v13, Ll/pa00;->a:J

    .line 186
    .line 187
    const-wide/16 v19, 0x1

    .line 188
    .line 189
    add-long v14, v14, v19

    .line 190
    .line 191
    iput-wide v14, v13, Ll/pa00;->a:J

    .line 192
    .line 193
    :cond_b
    if-ne v11, v6, :cond_c

    .line 194
    .line 195
    const/4 v11, 0x1

    .line 196
    goto :goto_7

    .line 197
    :cond_c
    const/4 v11, 0x0

    .line 198
    :goto_7
    invoke-virtual {v10, v11}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->z0(Z)V

    .line 199
    .line 200
    .line 201
    if-ne v12, v6, :cond_d

    .line 202
    .line 203
    const/4 v15, 0x1

    .line 204
    goto :goto_8

    .line 205
    :cond_d
    const/4 v15, 0x0

    .line 206
    :goto_8
    invoke-virtual {v10, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c0(Z)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    .line 210
    .line 211
    .line 212
    move-result v11

    .line 213
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    .line 214
    .line 215
    .line 216
    move-result v12

    .line 217
    goto :goto_9

    .line 218
    :cond_e
    const/16 v16, 0x0

    .line 219
    .line 220
    const/16 v17, 0x0

    .line 221
    .line 222
    :goto_9
    invoke-virtual {v10, v11}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v10, v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 226
    .line 227
    .line 228
    if-eqz v16, :cond_f

    .line 229
    .line 230
    invoke-virtual {v10, v11}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B0(I)V

    .line 231
    .line 232
    .line 233
    :cond_f
    if-eqz v17, :cond_10

    .line 234
    .line 235
    invoke-virtual {v10, v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->A0(I)V

    .line 236
    .line 237
    .line 238
    :cond_10
    iget-boolean v6, v9, Landroidx/constraintlayout/widget/ConstraintLayout$a;->X:Z

    .line 239
    .line 240
    if-eqz v6, :cond_11

    .line 241
    .line 242
    invoke-virtual {v8}, Landroid/view/View;->getBaseline()I

    .line 243
    .line 244
    .line 245
    move-result v6

    .line 246
    const/4 v8, -0x1

    .line 247
    if-eq v6, v8, :cond_11

    .line 248
    .line 249
    invoke-virtual {v10, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V(I)V

    .line 250
    .line 251
    .line 252
    :cond_11
    :goto_a
    add-int/lit8 v7, v7, 0x1

    .line 253
    .line 254
    goto/16 :goto_0

    .line 255
    .line 256
    :cond_12
    return-void
.end method

.method private internalMeasureDimensions(II)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    add-int/2addr v3, v4

    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    add-int/2addr v4, v5

    .line 25
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    const/4 v7, 0x0

    .line 30
    :goto_0
    const/16 v10, 0x8

    .line 31
    .line 32
    const/4 v12, -0x2

    .line 33
    if-ge v7, v5, :cond_d

    .line 34
    .line 35
    invoke-virtual {v0, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v14

    .line 39
    invoke-virtual {v14}, Landroid/view/View;->getVisibility()I

    .line 40
    .line 41
    .line 42
    move-result v15

    .line 43
    if-ne v15, v10, :cond_0

    .line 44
    .line 45
    goto/16 :goto_7

    .line 46
    .line 47
    :cond_0
    invoke-virtual {v14}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v10

    .line 51
    check-cast v10, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 52
    .line 53
    iget-object v15, v10, Landroidx/constraintlayout/widget/ConstraintLayout$a;->l0:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 54
    .line 55
    iget-boolean v6, v10, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Y:Z

    .line 56
    .line 57
    if-nez v6, :cond_c

    .line 58
    .line 59
    iget-boolean v6, v10, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Z:Z

    .line 60
    .line 61
    if-eqz v6, :cond_1

    .line 62
    .line 63
    goto/16 :goto_7

    .line 64
    .line 65
    :cond_1
    invoke-virtual {v14}, Landroid/view/View;->getVisibility()I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    invoke-virtual {v15, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x0(I)V

    .line 70
    .line 71
    .line 72
    iget v6, v10, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 73
    .line 74
    const-wide/16 v16, 0x1

    .line 75
    .line 76
    iget v8, v10, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 77
    .line 78
    if-eqz v6, :cond_b

    .line 79
    .line 80
    if-nez v8, :cond_2

    .line 81
    .line 82
    goto/16 :goto_6

    .line 83
    .line 84
    :cond_2
    if-ne v6, v12, :cond_3

    .line 85
    .line 86
    const/4 v9, 0x1

    .line 87
    goto :goto_1

    .line 88
    :cond_3
    const/4 v9, 0x0

    .line 89
    :goto_1
    invoke-static {v1, v4, v6}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 90
    .line 91
    .line 92
    move-result v13

    .line 93
    if-ne v8, v12, :cond_4

    .line 94
    .line 95
    const/16 v18, 0x1

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_4
    const/16 v18, 0x0

    .line 99
    .line 100
    :goto_2
    invoke-static {v2, v3, v8}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 101
    .line 102
    .line 103
    move-result v11

    .line 104
    invoke-virtual {v14, v13, v11}, Landroid/view/View;->measure(II)V

    .line 105
    .line 106
    .line 107
    iget-object v11, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMetrics:Ll/pa00;

    .line 108
    .line 109
    if-eqz v11, :cond_5

    .line 110
    .line 111
    iget-wide v12, v11, Ll/pa00;->a:J

    .line 112
    .line 113
    add-long v12, v12, v16

    .line 114
    .line 115
    iput-wide v12, v11, Ll/pa00;->a:J

    .line 116
    .line 117
    const/4 v11, -0x2

    .line 118
    goto :goto_3

    .line 119
    :cond_5
    move v11, v12

    .line 120
    :goto_3
    if-ne v6, v11, :cond_6

    .line 121
    .line 122
    const/4 v6, 0x1

    .line 123
    goto :goto_4

    .line 124
    :cond_6
    const/4 v6, 0x0

    .line 125
    :goto_4
    invoke-virtual {v15, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->z0(Z)V

    .line 126
    .line 127
    .line 128
    if-ne v8, v11, :cond_7

    .line 129
    .line 130
    const/4 v13, 0x1

    .line 131
    goto :goto_5

    .line 132
    :cond_7
    const/4 v13, 0x0

    .line 133
    :goto_5
    invoke-virtual {v15, v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c0(Z)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    .line 137
    .line 138
    .line 139
    move-result v6

    .line 140
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    .line 141
    .line 142
    .line 143
    move-result v8

    .line 144
    invoke-virtual {v15, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v15, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 148
    .line 149
    .line 150
    if-eqz v9, :cond_8

    .line 151
    .line 152
    invoke-virtual {v15, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B0(I)V

    .line 153
    .line 154
    .line 155
    :cond_8
    if-eqz v18, :cond_9

    .line 156
    .line 157
    invoke-virtual {v15, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->A0(I)V

    .line 158
    .line 159
    .line 160
    :cond_9
    iget-boolean v9, v10, Landroidx/constraintlayout/widget/ConstraintLayout$a;->X:Z

    .line 161
    .line 162
    if-eqz v9, :cond_a

    .line 163
    .line 164
    invoke-virtual {v14}, Landroid/view/View;->getBaseline()I

    .line 165
    .line 166
    .line 167
    move-result v9

    .line 168
    const/4 v11, -0x1

    .line 169
    if-eq v9, v11, :cond_a

    .line 170
    .line 171
    invoke-virtual {v15, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V(I)V

    .line 172
    .line 173
    .line 174
    :cond_a
    iget-boolean v9, v10, Landroidx/constraintlayout/widget/ConstraintLayout$a;->V:Z

    .line 175
    .line 176
    if-eqz v9, :cond_c

    .line 177
    .line 178
    iget-boolean v9, v10, Landroidx/constraintlayout/widget/ConstraintLayout$a;->W:Z

    .line 179
    .line 180
    if-eqz v9, :cond_c

    .line 181
    .line 182
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 183
    .line 184
    .line 185
    move-result-object v9

    .line 186
    invoke-virtual {v9, v6}, Ll/r3d0;->h(I)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 190
    .line 191
    .line 192
    move-result-object v6

    .line 193
    invoke-virtual {v6, v8}, Ll/r3d0;->h(I)V

    .line 194
    .line 195
    .line 196
    goto :goto_7

    .line 197
    :cond_b
    :goto_6
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 198
    .line 199
    .line 200
    move-result-object v6

    .line 201
    invoke-virtual {v6}, Ll/s3d0;->c()V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 205
    .line 206
    .line 207
    move-result-object v6

    .line 208
    invoke-virtual {v6}, Ll/s3d0;->c()V

    .line 209
    .line 210
    .line 211
    :cond_c
    :goto_7
    add-int/lit8 v7, v7, 0x1

    .line 212
    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :cond_d
    const-wide/16 v16, 0x1

    .line 216
    .line 217
    iget-object v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 218
    .line 219
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/e;->f1()V

    .line 220
    .line 221
    .line 222
    const/4 v6, 0x0

    .line 223
    :goto_8
    if-ge v6, v5, :cond_2a

    .line 224
    .line 225
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 226
    .line 227
    .line 228
    move-result-object v7

    .line 229
    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    .line 230
    .line 231
    .line 232
    move-result v8

    .line 233
    if-ne v8, v10, :cond_10

    .line 234
    .line 235
    :cond_e
    :goto_9
    move/from16 v21, v5

    .line 236
    .line 237
    move/from16 v22, v6

    .line 238
    .line 239
    const/4 v6, -0x2

    .line 240
    :cond_f
    const/4 v13, -0x1

    .line 241
    goto/16 :goto_19

    .line 242
    .line 243
    :cond_10
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 244
    .line 245
    .line 246
    move-result-object v8

    .line 247
    check-cast v8, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 248
    .line 249
    iget-object v9, v8, Landroidx/constraintlayout/widget/ConstraintLayout$a;->l0:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 250
    .line 251
    iget-boolean v11, v8, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Y:Z

    .line 252
    .line 253
    if-nez v11, :cond_e

    .line 254
    .line 255
    iget-boolean v11, v8, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Z:Z

    .line 256
    .line 257
    if-eqz v11, :cond_11

    .line 258
    .line 259
    goto :goto_9

    .line 260
    :cond_11
    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    .line 261
    .line 262
    .line 263
    move-result v11

    .line 264
    invoke-virtual {v9, v11}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x0(I)V

    .line 265
    .line 266
    .line 267
    iget v11, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 268
    .line 269
    iget v12, v8, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 270
    .line 271
    if-eqz v11, :cond_12

    .line 272
    .line 273
    if-eqz v12, :cond_12

    .line 274
    .line 275
    goto :goto_9

    .line 276
    :cond_12
    sget-object v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 277
    .line 278
    invoke-virtual {v9, v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 279
    .line 280
    .line 281
    move-result-object v14

    .line 282
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 283
    .line 284
    .line 285
    move-result-object v14

    .line 286
    sget-object v15, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 287
    .line 288
    invoke-virtual {v9, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 289
    .line 290
    .line 291
    move-result-object v18

    .line 292
    invoke-virtual/range {v18 .. v18}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 293
    .line 294
    .line 295
    move-result-object v18

    .line 296
    invoke-virtual {v9, v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 297
    .line 298
    .line 299
    move-result-object v13

    .line 300
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->i()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 301
    .line 302
    .line 303
    move-result-object v13

    .line 304
    if-eqz v13, :cond_13

    .line 305
    .line 306
    invoke-virtual {v9, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 307
    .line 308
    .line 309
    move-result-object v13

    .line 310
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->i()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 311
    .line 312
    .line 313
    move-result-object v13

    .line 314
    if-eqz v13, :cond_13

    .line 315
    .line 316
    const/4 v13, 0x1

    .line 317
    goto :goto_a

    .line 318
    :cond_13
    const/4 v13, 0x0

    .line 319
    :goto_a
    sget-object v15, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 320
    .line 321
    invoke-virtual {v9, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 322
    .line 323
    .line 324
    move-result-object v19

    .line 325
    invoke-virtual/range {v19 .. v19}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 326
    .line 327
    .line 328
    move-result-object v19

    .line 329
    sget-object v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 330
    .line 331
    invoke-virtual {v9, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 332
    .line 333
    .line 334
    move-result-object v20

    .line 335
    invoke-virtual/range {v20 .. v20}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 336
    .line 337
    .line 338
    move-result-object v20

    .line 339
    invoke-virtual {v9, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 340
    .line 341
    .line 342
    move-result-object v15

    .line 343
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->i()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 344
    .line 345
    .line 346
    move-result-object v15

    .line 347
    if-eqz v15, :cond_14

    .line 348
    .line 349
    invoke-virtual {v9, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 350
    .line 351
    .line 352
    move-result-object v10

    .line 353
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->i()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 354
    .line 355
    .line 356
    move-result-object v10

    .line 357
    if-eqz v10, :cond_14

    .line 358
    .line 359
    const/4 v10, 0x1

    .line 360
    goto :goto_b

    .line 361
    :cond_14
    const/4 v10, 0x0

    .line 362
    :goto_b
    if-nez v11, :cond_15

    .line 363
    .line 364
    if-nez v12, :cond_15

    .line 365
    .line 366
    if-eqz v13, :cond_15

    .line 367
    .line 368
    if-eqz v10, :cond_15

    .line 369
    .line 370
    goto/16 :goto_9

    .line 371
    .line 372
    :cond_15
    iget-object v15, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 373
    .line 374
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 375
    .line 376
    .line 377
    move-result-object v15

    .line 378
    move/from16 v21, v5

    .line 379
    .line 380
    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 381
    .line 382
    if-eq v15, v5, :cond_16

    .line 383
    .line 384
    const/4 v15, 0x1

    .line 385
    :goto_c
    move/from16 v22, v6

    .line 386
    .line 387
    goto :goto_d

    .line 388
    :cond_16
    const/4 v15, 0x0

    .line 389
    goto :goto_c

    .line 390
    :goto_d
    iget-object v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 391
    .line 392
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 393
    .line 394
    .line 395
    move-result-object v6

    .line 396
    if-eq v6, v5, :cond_17

    .line 397
    .line 398
    const/4 v5, 0x1

    .line 399
    goto :goto_e

    .line 400
    :cond_17
    const/4 v5, 0x0

    .line 401
    :goto_e
    if-nez v15, :cond_18

    .line 402
    .line 403
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 404
    .line 405
    .line 406
    move-result-object v6

    .line 407
    invoke-virtual {v6}, Ll/s3d0;->c()V

    .line 408
    .line 409
    .line 410
    :cond_18
    if-nez v5, :cond_19

    .line 411
    .line 412
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 413
    .line 414
    .line 415
    move-result-object v6

    .line 416
    invoke-virtual {v6}, Ll/s3d0;->c()V

    .line 417
    .line 418
    .line 419
    :cond_19
    if-nez v11, :cond_1b

    .line 420
    .line 421
    if-eqz v15, :cond_1a

    .line 422
    .line 423
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->P()Z

    .line 424
    .line 425
    .line 426
    move-result v6

    .line 427
    if-eqz v6, :cond_1a

    .line 428
    .line 429
    if-eqz v13, :cond_1a

    .line 430
    .line 431
    invoke-virtual {v14}, Ll/s3d0;->d()Z

    .line 432
    .line 433
    .line 434
    move-result v6

    .line 435
    if-eqz v6, :cond_1a

    .line 436
    .line 437
    invoke-virtual/range {v18 .. v18}, Ll/s3d0;->d()Z

    .line 438
    .line 439
    .line 440
    move-result v6

    .line 441
    if-eqz v6, :cond_1a

    .line 442
    .line 443
    invoke-virtual/range {v18 .. v18}, Landroidx/constraintlayout/solver/widgets/i;->k()F

    .line 444
    .line 445
    .line 446
    move-result v6

    .line 447
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/i;->k()F

    .line 448
    .line 449
    .line 450
    move-result v11

    .line 451
    sub-float/2addr v6, v11

    .line 452
    float-to-int v11, v6

    .line 453
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 454
    .line 455
    .line 456
    move-result-object v6

    .line 457
    invoke-virtual {v6, v11}, Ll/r3d0;->h(I)V

    .line 458
    .line 459
    .line 460
    invoke-static {v1, v4, v11}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 461
    .line 462
    .line 463
    move-result v6

    .line 464
    move v13, v11

    .line 465
    :goto_f
    const/4 v11, 0x0

    .line 466
    goto :goto_11

    .line 467
    :cond_1a
    const/4 v6, -0x2

    .line 468
    invoke-static {v1, v4, v6}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 469
    .line 470
    .line 471
    move-result v13

    .line 472
    move v6, v13

    .line 473
    const/4 v15, 0x0

    .line 474
    move v13, v11

    .line 475
    const/4 v11, 0x1

    .line 476
    goto :goto_11

    .line 477
    :cond_1b
    const/4 v6, -0x2

    .line 478
    const/4 v13, -0x1

    .line 479
    if-ne v11, v13, :cond_1c

    .line 480
    .line 481
    invoke-static {v1, v4, v13}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 482
    .line 483
    .line 484
    move-result v14

    .line 485
    move v13, v11

    .line 486
    move v6, v14

    .line 487
    goto :goto_f

    .line 488
    :cond_1c
    if-ne v11, v6, :cond_1d

    .line 489
    .line 490
    const/4 v6, 0x1

    .line 491
    goto :goto_10

    .line 492
    :cond_1d
    const/4 v6, 0x0

    .line 493
    :goto_10
    invoke-static {v1, v4, v11}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 494
    .line 495
    .line 496
    move-result v13

    .line 497
    move/from16 v23, v11

    .line 498
    .line 499
    move v11, v6

    .line 500
    move v6, v13

    .line 501
    move/from16 v13, v23

    .line 502
    .line 503
    :goto_11
    if-nez v12, :cond_1f

    .line 504
    .line 505
    if-eqz v5, :cond_1e

    .line 506
    .line 507
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->O()Z

    .line 508
    .line 509
    .line 510
    move-result v14

    .line 511
    if-eqz v14, :cond_1e

    .line 512
    .line 513
    if-eqz v10, :cond_1e

    .line 514
    .line 515
    invoke-virtual/range {v19 .. v19}, Ll/s3d0;->d()Z

    .line 516
    .line 517
    .line 518
    move-result v10

    .line 519
    if-eqz v10, :cond_1e

    .line 520
    .line 521
    invoke-virtual/range {v20 .. v20}, Ll/s3d0;->d()Z

    .line 522
    .line 523
    .line 524
    move-result v10

    .line 525
    if-eqz v10, :cond_1e

    .line 526
    .line 527
    invoke-virtual/range {v20 .. v20}, Landroidx/constraintlayout/solver/widgets/i;->k()F

    .line 528
    .line 529
    .line 530
    move-result v10

    .line 531
    invoke-virtual/range {v19 .. v19}, Landroidx/constraintlayout/solver/widgets/i;->k()F

    .line 532
    .line 533
    .line 534
    move-result v12

    .line 535
    sub-float/2addr v10, v12

    .line 536
    float-to-int v12, v10

    .line 537
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 538
    .line 539
    .line 540
    move-result-object v10

    .line 541
    invoke-virtual {v10, v12}, Ll/r3d0;->h(I)V

    .line 542
    .line 543
    .line 544
    invoke-static {v2, v3, v12}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 545
    .line 546
    .line 547
    move-result v10

    .line 548
    move v14, v12

    .line 549
    :goto_12
    const/4 v12, 0x0

    .line 550
    goto :goto_14

    .line 551
    :cond_1e
    const/4 v10, -0x2

    .line 552
    invoke-static {v2, v3, v10}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 553
    .line 554
    .line 555
    move-result v5

    .line 556
    move v10, v5

    .line 557
    move v14, v12

    .line 558
    const/4 v5, 0x0

    .line 559
    const/4 v12, 0x1

    .line 560
    goto :goto_14

    .line 561
    :cond_1f
    const/4 v10, -0x2

    .line 562
    const/4 v14, -0x1

    .line 563
    if-ne v12, v14, :cond_20

    .line 564
    .line 565
    invoke-static {v2, v3, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 566
    .line 567
    .line 568
    move-result v18

    .line 569
    move v14, v12

    .line 570
    move/from16 v10, v18

    .line 571
    .line 572
    goto :goto_12

    .line 573
    :cond_20
    if-ne v12, v10, :cond_21

    .line 574
    .line 575
    const/4 v10, 0x1

    .line 576
    goto :goto_13

    .line 577
    :cond_21
    const/4 v10, 0x0

    .line 578
    :goto_13
    invoke-static {v2, v3, v12}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 579
    .line 580
    .line 581
    move-result v14

    .line 582
    move/from16 v23, v12

    .line 583
    .line 584
    move v12, v10

    .line 585
    move v10, v14

    .line 586
    move/from16 v14, v23

    .line 587
    .line 588
    :goto_14
    invoke-virtual {v7, v6, v10}, Landroid/view/View;->measure(II)V

    .line 589
    .line 590
    .line 591
    iget-object v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMetrics:Ll/pa00;

    .line 592
    .line 593
    if-eqz v6, :cond_22

    .line 594
    .line 595
    iget-wide v0, v6, Ll/pa00;->a:J

    .line 596
    .line 597
    add-long v0, v0, v16

    .line 598
    .line 599
    iput-wide v0, v6, Ll/pa00;->a:J

    .line 600
    .line 601
    :cond_22
    const/4 v6, -0x2

    .line 602
    if-ne v13, v6, :cond_23

    .line 603
    .line 604
    const/4 v0, 0x1

    .line 605
    goto :goto_15

    .line 606
    :cond_23
    const/4 v0, 0x0

    .line 607
    :goto_15
    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->z0(Z)V

    .line 608
    .line 609
    .line 610
    if-ne v14, v6, :cond_24

    .line 611
    .line 612
    const/4 v0, 0x1

    .line 613
    goto :goto_16

    .line 614
    :cond_24
    const/4 v0, 0x0

    .line 615
    :goto_16
    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c0(Z)V

    .line 616
    .line 617
    .line 618
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    .line 619
    .line 620
    .line 621
    move-result v0

    .line 622
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    .line 623
    .line 624
    .line 625
    move-result v1

    .line 626
    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 627
    .line 628
    .line 629
    invoke-virtual {v9, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 630
    .line 631
    .line 632
    if-eqz v11, :cond_25

    .line 633
    .line 634
    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B0(I)V

    .line 635
    .line 636
    .line 637
    :cond_25
    if-eqz v12, :cond_26

    .line 638
    .line 639
    invoke-virtual {v9, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->A0(I)V

    .line 640
    .line 641
    .line 642
    :cond_26
    if-eqz v15, :cond_27

    .line 643
    .line 644
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 645
    .line 646
    .line 647
    move-result-object v10

    .line 648
    invoke-virtual {v10, v0}, Ll/r3d0;->h(I)V

    .line 649
    .line 650
    .line 651
    goto :goto_17

    .line 652
    :cond_27
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 653
    .line 654
    .line 655
    move-result-object v0

    .line 656
    invoke-virtual {v0}, Ll/r3d0;->g()V

    .line 657
    .line 658
    .line 659
    :goto_17
    if-eqz v5, :cond_28

    .line 660
    .line 661
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 662
    .line 663
    .line 664
    move-result-object v0

    .line 665
    invoke-virtual {v0, v1}, Ll/r3d0;->h(I)V

    .line 666
    .line 667
    .line 668
    goto :goto_18

    .line 669
    :cond_28
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 670
    .line 671
    .line 672
    move-result-object v0

    .line 673
    invoke-virtual {v0}, Ll/r3d0;->g()V

    .line 674
    .line 675
    .line 676
    :goto_18
    iget-boolean v0, v8, Landroidx/constraintlayout/widget/ConstraintLayout$a;->X:Z

    .line 677
    .line 678
    if-eqz v0, :cond_f

    .line 679
    .line 680
    invoke-virtual {v7}, Landroid/view/View;->getBaseline()I

    .line 681
    .line 682
    .line 683
    move-result v0

    .line 684
    const/4 v13, -0x1

    .line 685
    if-eq v0, v13, :cond_29

    .line 686
    .line 687
    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V(I)V

    .line 688
    .line 689
    .line 690
    :cond_29
    :goto_19
    add-int/lit8 v0, v22, 0x1

    .line 691
    .line 692
    const/16 v10, 0x8

    .line 693
    .line 694
    move/from16 v1, p1

    .line 695
    .line 696
    move v6, v0

    .line 697
    move/from16 v5, v21

    .line 698
    .line 699
    move-object/from16 v0, p0

    .line 700
    .line 701
    goto/16 :goto_8

    .line 702
    .line 703
    :cond_2a
    return-void
.end method

.method private setChildrenConstraints()V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->isInEditMode()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    const/4 v4, -0x1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    move v5, v3

    .line 16
    :goto_0
    if-ge v5, v2, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    :try_start_0
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v7

    .line 26
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 27
    .line 28
    .line 29
    move-result v8

    .line 30
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v7

    .line 34
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 35
    .line 36
    .line 37
    move-result v8

    .line 38
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v8

    .line 42
    invoke-virtual {v0, v3, v7, v8}, Landroidx/constraintlayout/widget/ConstraintLayout;->setDesignInformation(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    const/16 v8, 0x2f

    .line 46
    .line 47
    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    .line 48
    .line 49
    .line 50
    move-result v8

    .line 51
    if-eq v8, v4, :cond_0

    .line 52
    .line 53
    add-int/lit8 v8, v8, 0x1

    .line 54
    .line 55
    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    :cond_0
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    invoke-direct {v0, v6}, Landroidx/constraintlayout/widget/ConstraintLayout;->getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    invoke-virtual {v6, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->X(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    :catch_0
    add-int/lit8 v5, v5, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    move v5, v3

    .line 74
    :goto_1
    if-ge v5, v2, :cond_3

    .line 75
    .line 76
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    invoke-virtual {v0, v6}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewWidget(Landroid/view/View;)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    if-nez v6, :cond_2

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_2
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Q()V

    .line 88
    .line 89
    .line 90
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_3
    iget v5, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    .line 94
    .line 95
    if-eq v5, v4, :cond_5

    .line 96
    .line 97
    move v5, v3

    .line 98
    :goto_3
    if-ge v5, v2, :cond_5

    .line 99
    .line 100
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 105
    .line 106
    .line 107
    move-result v7

    .line 108
    iget v8, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    .line 109
    .line 110
    if-ne v7, v8, :cond_4

    .line 111
    .line 112
    instance-of v7, v6, Landroidx/constraintlayout/widget/Constraints;

    .line 113
    .line 114
    if-eqz v7, :cond_4

    .line 115
    .line 116
    check-cast v6, Landroidx/constraintlayout/widget/Constraints;

    .line 117
    .line 118
    invoke-virtual {v6}, Landroidx/constraintlayout/widget/Constraints;->getConstraintSet()Landroidx/constraintlayout/widget/a;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    iput-object v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/a;

    .line 123
    .line 124
    :cond_4
    add-int/lit8 v5, v5, 0x1

    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_5
    iget-object v5, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/a;

    .line 128
    .line 129
    if-eqz v5, :cond_6

    .line 130
    .line 131
    invoke-virtual {v5, v0}, Landroidx/constraintlayout/widget/a;->b(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 132
    .line 133
    .line 134
    :cond_6
    iget-object v5, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 135
    .line 136
    invoke-virtual {v5}, Ll/jfq0;->M0()V

    .line 137
    .line 138
    .line 139
    iget-object v5, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    if-lez v5, :cond_7

    .line 146
    .line 147
    move v6, v3

    .line 148
    :goto_4
    if-ge v6, v5, :cond_7

    .line 149
    .line 150
    iget-object v7, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 151
    .line 152
    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    check-cast v7, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 157
    .line 158
    invoke-virtual {v7, v0}, Landroidx/constraintlayout/widget/ConstraintHelper;->e(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 159
    .line 160
    .line 161
    add-int/lit8 v6, v6, 0x1

    .line 162
    .line 163
    goto :goto_4

    .line 164
    :cond_7
    move v5, v3

    .line 165
    :goto_5
    if-ge v5, v2, :cond_9

    .line 166
    .line 167
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v6

    .line 171
    instance-of v7, v6, Landroidx/constraintlayout/widget/Placeholder;

    .line 172
    .line 173
    if-eqz v7, :cond_8

    .line 174
    .line 175
    check-cast v6, Landroidx/constraintlayout/widget/Placeholder;

    .line 176
    .line 177
    invoke-virtual {v6, v0}, Landroidx/constraintlayout/widget/Placeholder;->c(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 178
    .line 179
    .line 180
    :cond_8
    add-int/lit8 v5, v5, 0x1

    .line 181
    .line 182
    goto :goto_5

    .line 183
    :cond_9
    move v5, v3

    .line 184
    :goto_6
    if-ge v5, v2, :cond_29

    .line 185
    .line 186
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v6

    .line 190
    invoke-virtual {v0, v6}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewWidget(Landroid/view/View;)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 191
    .line 192
    .line 193
    move-result-object v7

    .line 194
    if-nez v7, :cond_a

    .line 195
    .line 196
    goto/16 :goto_f

    .line 197
    .line 198
    :cond_a
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 199
    .line 200
    .line 201
    move-result-object v8

    .line 202
    move-object v13, v8

    .line 203
    check-cast v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 204
    .line 205
    invoke-virtual {v13}, Landroidx/constraintlayout/widget/ConstraintLayout$a;->a()V

    .line 206
    .line 207
    .line 208
    iget-boolean v8, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->m0:Z

    .line 209
    .line 210
    if-eqz v8, :cond_b

    .line 211
    .line 212
    iput-boolean v3, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->m0:Z

    .line 213
    .line 214
    goto :goto_7

    .line 215
    :cond_b
    if-eqz v1, :cond_c

    .line 216
    .line 217
    :try_start_1
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 218
    .line 219
    .line 220
    move-result-object v8

    .line 221
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 222
    .line 223
    .line 224
    move-result v9

    .line 225
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v8

    .line 229
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 230
    .line 231
    .line 232
    move-result v9

    .line 233
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 234
    .line 235
    .line 236
    move-result-object v9

    .line 237
    invoke-virtual {v0, v3, v8, v9}, Landroidx/constraintlayout/widget/ConstraintLayout;->setDesignInformation(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 238
    .line 239
    .line 240
    const-string v9, "id/"

    .line 241
    .line 242
    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 243
    .line 244
    .line 245
    move-result v9

    .line 246
    add-int/lit8 v9, v9, 0x3

    .line 247
    .line 248
    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v8

    .line 252
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 253
    .line 254
    .line 255
    move-result v9

    .line 256
    invoke-direct {v0, v9}, Landroidx/constraintlayout/widget/ConstraintLayout;->getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 257
    .line 258
    .line 259
    move-result-object v9

    .line 260
    invoke-virtual {v9, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->X(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 261
    .line 262
    .line 263
    :catch_1
    :cond_c
    :goto_7
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 264
    .line 265
    .line 266
    move-result v8

    .line 267
    invoke-virtual {v7, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x0(I)V

    .line 268
    .line 269
    .line 270
    iget-boolean v8, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->a0:Z

    .line 271
    .line 272
    if-eqz v8, :cond_d

    .line 273
    .line 274
    const/16 v8, 0x8

    .line 275
    .line 276
    invoke-virtual {v7, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x0(I)V

    .line 277
    .line 278
    .line 279
    :cond_d
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W(Ljava/lang/Object;)V

    .line 280
    .line 281
    .line 282
    iget-object v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 283
    .line 284
    invoke-virtual {v6, v7}, Ll/jfq0;->I0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    .line 285
    .line 286
    .line 287
    iget-boolean v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->W:Z

    .line 288
    .line 289
    if-eqz v6, :cond_e

    .line 290
    .line 291
    iget-boolean v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->V:Z

    .line 292
    .line 293
    if-nez v6, :cond_f

    .line 294
    .line 295
    :cond_e
    iget-object v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    .line 296
    .line 297
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    :cond_f
    iget-boolean v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Y:Z

    .line 301
    .line 302
    if-eqz v6, :cond_12

    .line 303
    .line 304
    check-cast v7, Landroidx/constraintlayout/solver/widgets/g;

    .line 305
    .line 306
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->i0:I

    .line 307
    .line 308
    iget v8, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->j0:I

    .line 309
    .line 310
    iget v9, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->k0:F

    .line 311
    .line 312
    const/high16 v10, -0x40800000    # -1.0f

    .line 313
    .line 314
    cmpl-float v10, v9, v10

    .line 315
    .line 316
    if-eqz v10, :cond_10

    .line 317
    .line 318
    invoke-virtual {v7, v9}, Landroidx/constraintlayout/solver/widgets/g;->L0(F)V

    .line 319
    .line 320
    .line 321
    goto/16 :goto_f

    .line 322
    .line 323
    :cond_10
    if-eq v6, v4, :cond_11

    .line 324
    .line 325
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/g;->J0(I)V

    .line 326
    .line 327
    .line 328
    goto/16 :goto_f

    .line 329
    .line 330
    :cond_11
    if-eq v8, v4, :cond_28

    .line 331
    .line 332
    invoke-virtual {v7, v8}, Landroidx/constraintlayout/solver/widgets/g;->K0(I)V

    .line 333
    .line 334
    .line 335
    goto/16 :goto_f

    .line 336
    .line 337
    :cond_12
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->d:I

    .line 338
    .line 339
    if-ne v6, v4, :cond_13

    .line 340
    .line 341
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->e:I

    .line 342
    .line 343
    if-ne v6, v4, :cond_13

    .line 344
    .line 345
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->f:I

    .line 346
    .line 347
    if-ne v6, v4, :cond_13

    .line 348
    .line 349
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->g:I

    .line 350
    .line 351
    if-ne v6, v4, :cond_13

    .line 352
    .line 353
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->q:I

    .line 354
    .line 355
    if-ne v6, v4, :cond_13

    .line 356
    .line 357
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->p:I

    .line 358
    .line 359
    if-ne v6, v4, :cond_13

    .line 360
    .line 361
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->r:I

    .line 362
    .line 363
    if-ne v6, v4, :cond_13

    .line 364
    .line 365
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->s:I

    .line 366
    .line 367
    if-ne v6, v4, :cond_13

    .line 368
    .line 369
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 370
    .line 371
    if-ne v6, v4, :cond_13

    .line 372
    .line 373
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->i:I

    .line 374
    .line 375
    if-ne v6, v4, :cond_13

    .line 376
    .line 377
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->j:I

    .line 378
    .line 379
    if-ne v6, v4, :cond_13

    .line 380
    .line 381
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->k:I

    .line 382
    .line 383
    if-ne v6, v4, :cond_13

    .line 384
    .line 385
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->l:I

    .line 386
    .line 387
    if-ne v6, v4, :cond_13

    .line 388
    .line 389
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Q:I

    .line 390
    .line 391
    if-ne v6, v4, :cond_13

    .line 392
    .line 393
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->R:I

    .line 394
    .line 395
    if-ne v6, v4, :cond_13

    .line 396
    .line 397
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->m:I

    .line 398
    .line 399
    if-ne v6, v4, :cond_13

    .line 400
    .line 401
    iget v6, v13, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 402
    .line 403
    if-eq v6, v4, :cond_13

    .line 404
    .line 405
    iget v6, v13, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 406
    .line 407
    if-ne v6, v4, :cond_28

    .line 408
    .line 409
    :cond_13
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->b0:I

    .line 410
    .line 411
    iget v8, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->c0:I

    .line 412
    .line 413
    iget v14, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->d0:I

    .line 414
    .line 415
    iget v15, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->e0:I

    .line 416
    .line 417
    iget v12, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->f0:I

    .line 418
    .line 419
    iget v9, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->g0:I

    .line 420
    .line 421
    iget v10, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h0:F

    .line 422
    .line 423
    iget v11, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->m:I

    .line 424
    .line 425
    if-eq v11, v4, :cond_14

    .line 426
    .line 427
    invoke-direct {v0, v11}, Landroidx/constraintlayout/widget/ConstraintLayout;->getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 428
    .line 429
    .line 430
    move-result-object v6

    .line 431
    if-eqz v6, :cond_20

    .line 432
    .line 433
    iget v8, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->o:F

    .line 434
    .line 435
    iget v9, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->n:I

    .line 436
    .line 437
    invoke-virtual {v7, v6, v8, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;FI)V

    .line 438
    .line 439
    .line 440
    goto/16 :goto_c

    .line 441
    .line 442
    :cond_14
    if-eq v6, v4, :cond_16

    .line 443
    .line 444
    invoke-direct {v0, v6}, Landroidx/constraintlayout/widget/ConstraintLayout;->getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 445
    .line 446
    .line 447
    move-result-object v6

    .line 448
    if-eqz v6, :cond_15

    .line 449
    .line 450
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 451
    .line 452
    iget v11, v13, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 453
    .line 454
    move/from16 v16, v10

    .line 455
    .line 456
    move-object v10, v8

    .line 457
    move v3, v9

    .line 458
    move-object v9, v6

    .line 459
    move v6, v3

    .line 460
    move/from16 v3, v16

    .line 461
    .line 462
    invoke-virtual/range {v7 .. v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;II)V

    .line 463
    .line 464
    .line 465
    goto :goto_8

    .line 466
    :cond_15
    move v6, v9

    .line 467
    move v3, v10

    .line 468
    goto :goto_8

    .line 469
    :cond_16
    move v6, v9

    .line 470
    move v3, v10

    .line 471
    if-eq v8, v4, :cond_17

    .line 472
    .line 473
    invoke-direct {v0, v8}, Landroidx/constraintlayout/widget/ConstraintLayout;->getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 474
    .line 475
    .line 476
    move-result-object v9

    .line 477
    if-eqz v9, :cond_17

    .line 478
    .line 479
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 480
    .line 481
    sget-object v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 482
    .line 483
    iget v11, v13, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 484
    .line 485
    invoke-virtual/range {v7 .. v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;II)V

    .line 486
    .line 487
    .line 488
    :cond_17
    :goto_8
    if-eq v14, v4, :cond_18

    .line 489
    .line 490
    invoke-direct {v0, v14}, Landroidx/constraintlayout/widget/ConstraintLayout;->getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 491
    .line 492
    .line 493
    move-result-object v9

    .line 494
    if-eqz v9, :cond_19

    .line 495
    .line 496
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 497
    .line 498
    sget-object v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 499
    .line 500
    iget v11, v13, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 501
    .line 502
    move v12, v6

    .line 503
    invoke-virtual/range {v7 .. v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;II)V

    .line 504
    .line 505
    .line 506
    goto :goto_9

    .line 507
    :cond_18
    move v12, v6

    .line 508
    if-eq v15, v4, :cond_19

    .line 509
    .line 510
    invoke-direct {v0, v15}, Landroidx/constraintlayout/widget/ConstraintLayout;->getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 511
    .line 512
    .line 513
    move-result-object v9

    .line 514
    if-eqz v9, :cond_19

    .line 515
    .line 516
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 517
    .line 518
    iget v11, v13, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 519
    .line 520
    move-object v10, v8

    .line 521
    invoke-virtual/range {v7 .. v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;II)V

    .line 522
    .line 523
    .line 524
    :cond_19
    :goto_9
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 525
    .line 526
    if-eq v6, v4, :cond_1a

    .line 527
    .line 528
    invoke-direct {v0, v6}, Landroidx/constraintlayout/widget/ConstraintLayout;->getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 529
    .line 530
    .line 531
    move-result-object v9

    .line 532
    if-eqz v9, :cond_1b

    .line 533
    .line 534
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 535
    .line 536
    iget v11, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 537
    .line 538
    iget v12, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->u:I

    .line 539
    .line 540
    move-object v10, v8

    .line 541
    invoke-virtual/range {v7 .. v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;II)V

    .line 542
    .line 543
    .line 544
    goto :goto_a

    .line 545
    :cond_1a
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->i:I

    .line 546
    .line 547
    if-eq v6, v4, :cond_1b

    .line 548
    .line 549
    invoke-direct {v0, v6}, Landroidx/constraintlayout/widget/ConstraintLayout;->getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 550
    .line 551
    .line 552
    move-result-object v9

    .line 553
    if-eqz v9, :cond_1b

    .line 554
    .line 555
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 556
    .line 557
    sget-object v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 558
    .line 559
    iget v11, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 560
    .line 561
    iget v12, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->u:I

    .line 562
    .line 563
    invoke-virtual/range {v7 .. v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;II)V

    .line 564
    .line 565
    .line 566
    :cond_1b
    :goto_a
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->j:I

    .line 567
    .line 568
    if-eq v6, v4, :cond_1c

    .line 569
    .line 570
    invoke-direct {v0, v6}, Landroidx/constraintlayout/widget/ConstraintLayout;->getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 571
    .line 572
    .line 573
    move-result-object v9

    .line 574
    if-eqz v9, :cond_1d

    .line 575
    .line 576
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 577
    .line 578
    sget-object v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 579
    .line 580
    iget v11, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 581
    .line 582
    iget v12, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->w:I

    .line 583
    .line 584
    invoke-virtual/range {v7 .. v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;II)V

    .line 585
    .line 586
    .line 587
    goto :goto_b

    .line 588
    :cond_1c
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->k:I

    .line 589
    .line 590
    if-eq v6, v4, :cond_1d

    .line 591
    .line 592
    invoke-direct {v0, v6}, Landroidx/constraintlayout/widget/ConstraintLayout;->getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 593
    .line 594
    .line 595
    move-result-object v9

    .line 596
    if-eqz v9, :cond_1d

    .line 597
    .line 598
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 599
    .line 600
    iget v11, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 601
    .line 602
    iget v12, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->w:I

    .line 603
    .line 604
    move-object v10, v8

    .line 605
    invoke-virtual/range {v7 .. v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;II)V

    .line 606
    .line 607
    .line 608
    :cond_1d
    :goto_b
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->l:I

    .line 609
    .line 610
    if-eq v6, v4, :cond_1e

    .line 611
    .line 612
    iget-object v8, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 613
    .line 614
    invoke-virtual {v8, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 615
    .line 616
    .line 617
    move-result-object v6

    .line 618
    check-cast v6, Landroid/view/View;

    .line 619
    .line 620
    iget v8, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->l:I

    .line 621
    .line 622
    invoke-direct {v0, v8}, Landroidx/constraintlayout/widget/ConstraintLayout;->getTargetWidget(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 623
    .line 624
    .line 625
    move-result-object v8

    .line 626
    if-eqz v8, :cond_1e

    .line 627
    .line 628
    if-eqz v6, :cond_1e

    .line 629
    .line 630
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 631
    .line 632
    .line 633
    move-result-object v9

    .line 634
    instance-of v9, v9, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 635
    .line 636
    if-eqz v9, :cond_1e

    .line 637
    .line 638
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 639
    .line 640
    .line 641
    move-result-object v6

    .line 642
    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 643
    .line 644
    const/4 v9, 0x1

    .line 645
    iput-boolean v9, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->X:Z

    .line 646
    .line 647
    iput-boolean v9, v6, Landroidx/constraintlayout/widget/ConstraintLayout$a;->X:Z

    .line 648
    .line 649
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BASELINE:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 650
    .line 651
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 652
    .line 653
    .line 654
    move-result-object v17

    .line 655
    invoke-virtual {v8, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 656
    .line 657
    .line 658
    move-result-object v18

    .line 659
    sget-object v21, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Strength;->STRONG:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Strength;

    .line 660
    .line 661
    const/16 v22, 0x0

    .line 662
    .line 663
    const/16 v23, 0x1

    .line 664
    .line 665
    const/16 v19, 0x0

    .line 666
    .line 667
    const/16 v20, -0x1

    .line 668
    .line 669
    invoke-virtual/range {v17 .. v23}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->a(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IILandroidx/constraintlayout/solver/widgets/ConstraintAnchor$Strength;IZ)Z

    .line 670
    .line 671
    .line 672
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 673
    .line 674
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 675
    .line 676
    .line 677
    move-result-object v6

    .line 678
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->m()V

    .line 679
    .line 680
    .line 681
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 682
    .line 683
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 684
    .line 685
    .line 686
    move-result-object v6

    .line 687
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->m()V

    .line 688
    .line 689
    .line 690
    :cond_1e
    const/4 v6, 0x0

    .line 691
    cmpl-float v8, v3, v6

    .line 692
    .line 693
    const/high16 v9, 0x3f000000    # 0.5f

    .line 694
    .line 695
    if-ltz v8, :cond_1f

    .line 696
    .line 697
    cmpl-float v8, v3, v9

    .line 698
    .line 699
    if-eqz v8, :cond_1f

    .line 700
    .line 701
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0(F)V

    .line 702
    .line 703
    .line 704
    :cond_1f
    iget v3, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->A:F

    .line 705
    .line 706
    cmpl-float v6, v3, v6

    .line 707
    .line 708
    if-ltz v6, :cond_20

    .line 709
    .line 710
    cmpl-float v6, v3, v9

    .line 711
    .line 712
    if-eqz v6, :cond_20

    .line 713
    .line 714
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r0(F)V

    .line 715
    .line 716
    .line 717
    :cond_20
    :goto_c
    if-eqz v1, :cond_22

    .line 718
    .line 719
    iget v3, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Q:I

    .line 720
    .line 721
    if-ne v3, v4, :cond_21

    .line 722
    .line 723
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->R:I

    .line 724
    .line 725
    if-eq v6, v4, :cond_22

    .line 726
    .line 727
    :cond_21
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->R:I

    .line 728
    .line 729
    invoke-virtual {v7, v3, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->o0(II)V

    .line 730
    .line 731
    .line 732
    :cond_22
    iget-boolean v3, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->V:Z

    .line 733
    .line 734
    if-nez v3, :cond_24

    .line 735
    .line 736
    iget v3, v13, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 737
    .line 738
    if-ne v3, v4, :cond_23

    .line 739
    .line 740
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_PARENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 741
    .line 742
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 743
    .line 744
    .line 745
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 746
    .line 747
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 748
    .line 749
    .line 750
    move-result-object v3

    .line 751
    iget v6, v13, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 752
    .line 753
    iput v6, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->e:I

    .line 754
    .line 755
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 756
    .line 757
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 758
    .line 759
    .line 760
    move-result-object v3

    .line 761
    iget v6, v13, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 762
    .line 763
    iput v6, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->e:I

    .line 764
    .line 765
    goto :goto_d

    .line 766
    :cond_23
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 767
    .line 768
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 769
    .line 770
    .line 771
    const/4 v3, 0x0

    .line 772
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 773
    .line 774
    .line 775
    goto :goto_d

    .line 776
    :cond_24
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 777
    .line 778
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 779
    .line 780
    .line 781
    iget v3, v13, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 782
    .line 783
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 784
    .line 785
    .line 786
    :goto_d
    iget-boolean v3, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->W:Z

    .line 787
    .line 788
    if-nez v3, :cond_26

    .line 789
    .line 790
    iget v3, v13, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 791
    .line 792
    if-ne v3, v4, :cond_25

    .line 793
    .line 794
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_PARENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 795
    .line 796
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 797
    .line 798
    .line 799
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 800
    .line 801
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 802
    .line 803
    .line 804
    move-result-object v3

    .line 805
    iget v6, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 806
    .line 807
    iput v6, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->e:I

    .line 808
    .line 809
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 810
    .line 811
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 812
    .line 813
    .line 814
    move-result-object v3

    .line 815
    iget v6, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 816
    .line 817
    iput v6, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->e:I

    .line 818
    .line 819
    const/4 v3, 0x0

    .line 820
    goto :goto_e

    .line 821
    :cond_25
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 822
    .line 823
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 824
    .line 825
    .line 826
    const/4 v3, 0x0

    .line 827
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 828
    .line 829
    .line 830
    goto :goto_e

    .line 831
    :cond_26
    const/4 v3, 0x0

    .line 832
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 833
    .line 834
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 835
    .line 836
    .line 837
    iget v6, v13, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 838
    .line 839
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 840
    .line 841
    .line 842
    :goto_e
    iget-object v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->B:Ljava/lang/String;

    .line 843
    .line 844
    if-eqz v6, :cond_27

    .line 845
    .line 846
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Y(Ljava/lang/String;)V

    .line 847
    .line 848
    .line 849
    :cond_27
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->E:F

    .line 850
    .line 851
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i0(F)V

    .line 852
    .line 853
    .line 854
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->F:F

    .line 855
    .line 856
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w0(F)V

    .line 857
    .line 858
    .line 859
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->G:I

    .line 860
    .line 861
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e0(I)V

    .line 862
    .line 863
    .line 864
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->H:I

    .line 865
    .line 866
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s0(I)V

    .line 867
    .line 868
    .line 869
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->I:I

    .line 870
    .line 871
    iget v8, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->K:I

    .line 872
    .line 873
    iget v9, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->M:I

    .line 874
    .line 875
    iget v10, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->O:F

    .line 876
    .line 877
    invoke-virtual {v7, v6, v8, v9, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h0(IIIF)V

    .line 878
    .line 879
    .line 880
    iget v6, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->J:I

    .line 881
    .line 882
    iget v8, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->L:I

    .line 883
    .line 884
    iget v9, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->N:I

    .line 885
    .line 886
    iget v10, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->P:F

    .line 887
    .line 888
    invoke-virtual {v7, v6, v8, v9, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v0(IIIF)V

    .line 889
    .line 890
    .line 891
    :cond_28
    :goto_f
    add-int/lit8 v5, v5, 0x1

    .line 892
    .line 893
    goto/16 :goto_6

    .line 894
    .line 895
    :cond_29
    return-void
.end method

.method private setSelfDimensionBehaviour(II)V
    .locals 9

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    add-int/2addr v2, v3

    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    add-int/2addr v3, v4

    .line 35
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    .line 40
    const/high16 v5, 0x40000000    # 2.0f

    .line 41
    .line 42
    const/4 v6, 0x0

    .line 43
    const/high16 v7, -0x80000000

    .line 44
    .line 45
    if-eq v0, v7, :cond_2

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    if-eq v0, v5, :cond_0

    .line 50
    .line 51
    move-object p1, v4

    .line 52
    :goto_0
    move v0, v6

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 55
    .line 56
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    sub-int/2addr p1, v3

    .line 61
    move v0, p1

    .line 62
    move-object p1, v4

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    sget-object p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    sget-object v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 68
    .line 69
    move-object v8, v0

    .line 70
    move v0, p1

    .line 71
    move-object p1, v8

    .line 72
    :goto_1
    if-eq v1, v7, :cond_5

    .line 73
    .line 74
    if-eqz v1, :cond_4

    .line 75
    .line 76
    if-eq v1, v5, :cond_3

    .line 77
    .line 78
    :goto_2
    move p2, v6

    .line 79
    goto :goto_3

    .line 80
    :cond_3
    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    .line 81
    .line 82
    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    sub-int/2addr p2, v2

    .line 87
    goto :goto_3

    .line 88
    :cond_4
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_5
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 92
    .line 93
    :goto_3
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 94
    .line 95
    invoke-virtual {v1, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m0(I)V

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 99
    .line 100
    invoke-virtual {v1, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l0(I)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 104
    .line 105
    invoke-virtual {v1, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 109
    .line 110
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 114
    .line 115
    invoke-virtual {p1, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 119
    .line 120
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 124
    .line 125
    iget p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 126
    .line 127
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    sub-int/2addr p2, v0

    .line 132
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    sub-int/2addr p2, v0

    .line 137
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m0(I)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 141
    .line 142
    iget p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    .line 143
    .line 144
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    sub-int/2addr p2, v0

    .line 149
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    sub-int/2addr p2, p0

    .line 154
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l0(I)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method private updateHierarchy()V
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
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Landroid/view/View;->isLayoutRequested()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->setChildrenConstraints()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-void
.end method

.method private updatePostMeasures()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    instance-of v4, v3, Landroidx/constraintlayout/widget/Placeholder;

    .line 14
    .line 15
    if-eqz v4, :cond_0

    .line 16
    .line 17
    check-cast v3, Landroidx/constraintlayout/widget/Placeholder;

    .line 18
    .line 19
    invoke-virtual {v3, p0}, Landroidx/constraintlayout/widget/Placeholder;->b(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-lez v0, :cond_2

    .line 32
    .line 33
    :goto_1
    if-ge v1, v0, :cond_2

    .line 34
    .line 35
    iget-object v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 42
    .line 43
    invoke-virtual {v2, p0}, Landroidx/constraintlayout/widget/ConstraintHelper;->d(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 44
    .line 45
    .line 46
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 2
    .line 3
    return p0
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 17

    .line 1
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->isInEditMode()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    int-to-float v1, v1

    .line 19
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    int-to-float v2, v2

    .line 24
    const/4 v3, 0x0

    .line 25
    move v4, v3

    .line 26
    :goto_0
    if-ge v4, v0, :cond_2

    .line 27
    .line 28
    move-object/from16 v5, p0

    .line 29
    .line 30
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    const/16 v8, 0x8

    .line 39
    .line 40
    if-ne v7, v8, :cond_0

    .line 41
    .line 42
    goto/16 :goto_1

    .line 43
    .line 44
    :cond_0
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    if-eqz v6, :cond_1

    .line 49
    .line 50
    instance-of v7, v6, Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v7, :cond_1

    .line 53
    .line 54
    check-cast v6, Ljava/lang/String;

    .line 55
    .line 56
    const-string v7, ","

    .line 57
    .line 58
    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    array-length v7, v6

    .line 63
    const/4 v8, 0x4

    .line 64
    if-ne v7, v8, :cond_1

    .line 65
    .line 66
    aget-object v7, v6, v3

    .line 67
    .line 68
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v7

    .line 72
    const/4 v8, 0x1

    .line 73
    aget-object v8, v6, v8

    .line 74
    .line 75
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    const/4 v9, 0x2

    .line 80
    aget-object v9, v6, v9

    .line 81
    .line 82
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    const/4 v10, 0x3

    .line 87
    aget-object v6, v6, v10

    .line 88
    .line 89
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v6

    .line 93
    int-to-float v7, v7

    .line 94
    const/high16 v10, 0x44870000    # 1080.0f

    .line 95
    .line 96
    div-float/2addr v7, v10

    .line 97
    mul-float/2addr v7, v1

    .line 98
    float-to-int v7, v7

    .line 99
    int-to-float v8, v8

    .line 100
    const/high16 v11, 0x44f00000    # 1920.0f

    .line 101
    .line 102
    div-float/2addr v8, v11

    .line 103
    mul-float/2addr v8, v2

    .line 104
    float-to-int v8, v8

    .line 105
    int-to-float v9, v9

    .line 106
    div-float/2addr v9, v10

    .line 107
    mul-float/2addr v9, v1

    .line 108
    float-to-int v9, v9

    .line 109
    int-to-float v6, v6

    .line 110
    div-float/2addr v6, v11

    .line 111
    mul-float/2addr v6, v2

    .line 112
    float-to-int v6, v6

    .line 113
    new-instance v15, Landroid/graphics/Paint;

    .line 114
    .line 115
    invoke-direct {v15}, Landroid/graphics/Paint;-><init>()V

    .line 116
    .line 117
    .line 118
    const/high16 v10, -0x10000

    .line 119
    .line 120
    invoke-virtual {v15, v10}, Landroid/graphics/Paint;->setColor(I)V

    .line 121
    .line 122
    .line 123
    int-to-float v11, v7

    .line 124
    int-to-float v12, v8

    .line 125
    add-int/2addr v7, v9

    .line 126
    int-to-float v13, v7

    .line 127
    move v14, v12

    .line 128
    move-object/from16 v10, p1

    .line 129
    .line 130
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 131
    .line 132
    .line 133
    move v7, v11

    .line 134
    add-int/2addr v8, v6

    .line 135
    int-to-float v14, v8

    .line 136
    move v11, v13

    .line 137
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 138
    .line 139
    .line 140
    move v6, v12

    .line 141
    move v12, v14

    .line 142
    move v13, v7

    .line 143
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 144
    .line 145
    .line 146
    move v7, v11

    .line 147
    move v11, v13

    .line 148
    move v14, v6

    .line 149
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 150
    .line 151
    .line 152
    move/from16 v16, v14

    .line 153
    .line 154
    move v14, v12

    .line 155
    move/from16 v12, v16

    .line 156
    .line 157
    const v6, -0xff0100

    .line 158
    .line 159
    .line 160
    invoke-virtual {v15, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 161
    .line 162
    .line 163
    move v13, v7

    .line 164
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 165
    .line 166
    .line 167
    move/from16 v16, v14

    .line 168
    .line 169
    move v14, v12

    .line 170
    move/from16 v12, v16

    .line 171
    .line 172
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 173
    .line 174
    .line 175
    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_2
    return-void
.end method

.method public fillMetrics(Ll/pa00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMetrics:Ll/pa00;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/e;->R0(Ll/pa00;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 8
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->generateDefaultLayoutParams()Landroidx/constraintlayout/widget/ConstraintLayout$a;

    move-result-object p0

    return-object p0
.end method

.method public generateDefaultLayoutParams()Landroidx/constraintlayout/widget/ConstraintLayout$a;
    .locals 1

    .line 1
    new-instance p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 2
    .line 3
    const/4 v0, -0x2

    .line 4
    invoke-direct {p0, v0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 11
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroidx/constraintlayout/widget/ConstraintLayout$a;

    move-result-object p0

    return-object p0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 12
    new-instance p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroidx/constraintlayout/widget/ConstraintLayout$a;
    .locals 1

    .line 1
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public getDesignInformation(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    instance-of p1, p2, Ljava/lang/String;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p2, Ljava/lang/String;

    .line 8
    .line 9
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public getMaxHeight()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxWidth()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinHeight()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinWidth()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getOptimizationLevel()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/e;->S0()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getViewById(I)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/View;

    .line 8
    .line 9
    return-object p0
.end method

.method public final getViewWidget(Landroid/view/View;)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    if-nez p1, :cond_1

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0

    .line 10
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 15
    .line 16
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->l0:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 17
    .line 18
    return-object p0
.end method

.method public onLayout(ZIIII)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 p3, 0x0

    .line 10
    move p4, p3

    .line 11
    :goto_0
    if-ge p4, p1, :cond_3

    .line 12
    .line 13
    invoke-virtual {p0, p4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p5

    .line 17
    invoke-virtual {p5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 22
    .line 23
    iget-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->l0:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 24
    .line 25
    invoke-virtual {p5}, Landroid/view/View;->getVisibility()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/16 v3, 0x8

    .line 30
    .line 31
    if-ne v2, v3, :cond_0

    .line 32
    .line 33
    iget-boolean v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Y:Z

    .line 34
    .line 35
    if-nez v2, :cond_0

    .line 36
    .line 37
    iget-boolean v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Z:Z

    .line 38
    .line 39
    if-nez v2, :cond_0

    .line 40
    .line 41
    if-nez p2, :cond_0

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    iget-boolean v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->a0:Z

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    add-int/2addr v3, v0

    .line 62
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    add-int/2addr v1, v2

    .line 67
    invoke-virtual {p5, v0, v2, v3, v1}, Landroid/view/View;->layout(IIII)V

    .line 68
    .line 69
    .line 70
    instance-of v4, p5, Landroidx/constraintlayout/widget/Placeholder;

    .line 71
    .line 72
    if-eqz v4, :cond_2

    .line 73
    .line 74
    check-cast p5, Landroidx/constraintlayout/widget/Placeholder;

    .line 75
    .line 76
    invoke-virtual {p5}, Landroidx/constraintlayout/widget/Placeholder;->getContent()Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p5

    .line 80
    if-eqz p5, :cond_2

    .line 81
    .line 82
    invoke-virtual {p5, p3}, Landroid/view/View;->setVisibility(I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p5, v0, v2, v3, v1}, Landroid/view/View;->layout(IIII)V

    .line 86
    .line 87
    .line 88
    :cond_2
    :goto_1
    add-int/lit8 p4, p4, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_3
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-lez p1, :cond_4

    .line 98
    .line 99
    :goto_2
    if-ge p3, p1, :cond_4

    .line 100
    .line 101
    iget-object p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    check-cast p2, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 108
    .line 109
    invoke-virtual {p2, p0}, Landroidx/constraintlayout/widget/ConstraintHelper;->c(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 110
    .line 111
    .line 112
    add-int/lit8 p3, p3, 0x1

    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_4
    return-void
.end method

.method public onMeasure(II)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    invoke-static {v1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    invoke-static {v2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    invoke-static {v2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 31
    .line 32
    .line 33
    move-result v8

    .line 34
    iget-object v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 35
    .line 36
    invoke-virtual {v9, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C0(I)V

    .line 37
    .line 38
    .line 39
    iget-object v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 40
    .line 41
    invoke-virtual {v9, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D0(I)V

    .line 42
    .line 43
    .line 44
    iget-object v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 45
    .line 46
    iget v10, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 47
    .line 48
    invoke-virtual {v9, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k0(I)V

    .line 49
    .line 50
    .line 51
    iget-object v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 52
    .line 53
    iget v10, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    .line 54
    .line 55
    invoke-virtual {v9, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j0(I)V

    .line 56
    .line 57
    .line 58
    iget-object v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    const/4 v11, 0x0

    .line 65
    const/4 v12, 0x1

    .line 66
    if-ne v10, v12, :cond_0

    .line 67
    .line 68
    move v10, v12

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    move v10, v11

    .line 71
    :goto_0
    invoke-virtual {v9, v10}, Landroidx/constraintlayout/solver/widgets/e;->e1(Z)V

    .line 72
    .line 73
    .line 74
    invoke-direct/range {p0 .. p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->setSelfDimensionBehaviour(II)V

    .line 75
    .line 76
    .line 77
    iget-object v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 78
    .line 79
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 80
    .line 81
    .line 82
    move-result v9

    .line 83
    iget-object v10, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 84
    .line 85
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 86
    .line 87
    .line 88
    move-result v10

    .line 89
    iget-boolean v13, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    .line 90
    .line 91
    if-eqz v13, :cond_1

    .line 92
    .line 93
    iput-boolean v11, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    .line 94
    .line 95
    invoke-direct {v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->updateHierarchy()V

    .line 96
    .line 97
    .line 98
    move v13, v12

    .line 99
    goto :goto_1

    .line 100
    :cond_1
    move v13, v11

    .line 101
    :goto_1
    iget v14, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    .line 102
    .line 103
    const/16 v15, 0x8

    .line 104
    .line 105
    and-int/2addr v14, v15

    .line 106
    if-ne v14, v15, :cond_2

    .line 107
    .line 108
    move v14, v12

    .line 109
    goto :goto_2

    .line 110
    :cond_2
    move v14, v11

    .line 111
    :goto_2
    if-eqz v14, :cond_3

    .line 112
    .line 113
    iget-object v15, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 114
    .line 115
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/e;->b1()V

    .line 116
    .line 117
    .line 118
    iget-object v15, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 119
    .line 120
    invoke-virtual {v15, v9, v10}, Landroidx/constraintlayout/solver/widgets/e;->Z0(II)V

    .line 121
    .line 122
    .line 123
    invoke-direct/range {p0 .. p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->internalMeasureDimensions(II)V

    .line 124
    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_3
    invoke-direct/range {p0 .. p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->internalMeasureChildren(II)V

    .line 128
    .line 129
    .line 130
    :goto_3
    invoke-direct {v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->updatePostMeasures()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 134
    .line 135
    .line 136
    move-result v15

    .line 137
    if-lez v15, :cond_4

    .line 138
    .line 139
    if-eqz v13, :cond_4

    .line 140
    .line 141
    iget-object v13, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 142
    .line 143
    invoke-static {v13}, Landroidx/constraintlayout/solver/widgets/a;->a(Landroidx/constraintlayout/solver/widgets/e;)V

    .line 144
    .line 145
    .line 146
    :cond_4
    iget-object v13, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 147
    .line 148
    iget-boolean v15, v13, Landroidx/constraintlayout/solver/widgets/e;->I0:Z

    .line 149
    .line 150
    if-eqz v15, :cond_8

    .line 151
    .line 152
    iget-boolean v15, v13, Landroidx/constraintlayout/solver/widgets/e;->J0:Z

    .line 153
    .line 154
    const/high16 v12, -0x80000000

    .line 155
    .line 156
    if-eqz v15, :cond_6

    .line 157
    .line 158
    if-ne v3, v12, :cond_6

    .line 159
    .line 160
    iget v15, v13, Landroidx/constraintlayout/solver/widgets/e;->L0:I

    .line 161
    .line 162
    if-ge v15, v4, :cond_5

    .line 163
    .line 164
    invoke-virtual {v13, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 165
    .line 166
    .line 167
    :cond_5
    iget-object v13, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 168
    .line 169
    sget-object v15, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 170
    .line 171
    invoke-virtual {v13, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 172
    .line 173
    .line 174
    :cond_6
    iget-object v13, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 175
    .line 176
    iget-boolean v15, v13, Landroidx/constraintlayout/solver/widgets/e;->K0:Z

    .line 177
    .line 178
    if-eqz v15, :cond_8

    .line 179
    .line 180
    if-ne v5, v12, :cond_8

    .line 181
    .line 182
    iget v12, v13, Landroidx/constraintlayout/solver/widgets/e;->M0:I

    .line 183
    .line 184
    if-ge v12, v6, :cond_7

    .line 185
    .line 186
    invoke-virtual {v13, v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 187
    .line 188
    .line 189
    :cond_7
    iget-object v12, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 190
    .line 191
    sget-object v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 192
    .line 193
    invoke-virtual {v12, v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 194
    .line 195
    .line 196
    :cond_8
    iget v12, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    .line 197
    .line 198
    const/16 v13, 0x20

    .line 199
    .line 200
    and-int/2addr v12, v13

    .line 201
    const/high16 v15, 0x40000000    # 2.0f

    .line 202
    .line 203
    if-ne v12, v13, :cond_c

    .line 204
    .line 205
    iget-object v12, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 206
    .line 207
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 208
    .line 209
    .line 210
    move-result v12

    .line 211
    iget-object v13, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 212
    .line 213
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 214
    .line 215
    .line 216
    move-result v13

    .line 217
    iget v11, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidth:I

    .line 218
    .line 219
    if-eq v11, v12, :cond_9

    .line 220
    .line 221
    if-ne v3, v15, :cond_9

    .line 222
    .line 223
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 224
    .line 225
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 226
    .line 227
    const/4 v11, 0x0

    .line 228
    invoke-static {v3, v11, v12}, Landroidx/constraintlayout/solver/widgets/a;->i(Ljava/util/List;II)V

    .line 229
    .line 230
    .line 231
    :cond_9
    iget v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeight:I

    .line 232
    .line 233
    if-eq v3, v13, :cond_a

    .line 234
    .line 235
    if-ne v5, v15, :cond_a

    .line 236
    .line 237
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 238
    .line 239
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 240
    .line 241
    const/4 v5, 0x1

    .line 242
    invoke-static {v3, v5, v13}, Landroidx/constraintlayout/solver/widgets/a;->i(Ljava/util/List;II)V

    .line 243
    .line 244
    .line 245
    :cond_a
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 246
    .line 247
    iget-boolean v5, v3, Landroidx/constraintlayout/solver/widgets/e;->J0:Z

    .line 248
    .line 249
    if-eqz v5, :cond_b

    .line 250
    .line 251
    iget v5, v3, Landroidx/constraintlayout/solver/widgets/e;->L0:I

    .line 252
    .line 253
    if-le v5, v4, :cond_b

    .line 254
    .line 255
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 256
    .line 257
    const/4 v11, 0x0

    .line 258
    invoke-static {v3, v11, v4}, Landroidx/constraintlayout/solver/widgets/a;->i(Ljava/util/List;II)V

    .line 259
    .line 260
    .line 261
    goto :goto_4

    .line 262
    :cond_b
    const/4 v11, 0x0

    .line 263
    :goto_4
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 264
    .line 265
    iget-boolean v4, v3, Landroidx/constraintlayout/solver/widgets/e;->K0:Z

    .line 266
    .line 267
    if-eqz v4, :cond_c

    .line 268
    .line 269
    iget v4, v3, Landroidx/constraintlayout/solver/widgets/e;->M0:I

    .line 270
    .line 271
    if-le v4, v6, :cond_c

    .line 272
    .line 273
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 274
    .line 275
    const/4 v5, 0x1

    .line 276
    invoke-static {v3, v5, v6}, Landroidx/constraintlayout/solver/widgets/a;->i(Ljava/util/List;II)V

    .line 277
    .line 278
    .line 279
    goto :goto_5

    .line 280
    :cond_c
    const/4 v5, 0x1

    .line 281
    :goto_5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 282
    .line 283
    .line 284
    move-result v3

    .line 285
    if-lez v3, :cond_d

    .line 286
    .line 287
    const-string v3, "First pass"

    .line 288
    .line 289
    invoke-virtual {v0, v3}, Landroidx/constraintlayout/widget/ConstraintLayout;->solveLinearSystem(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    :cond_d
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    .line 293
    .line 294
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 295
    .line 296
    .line 297
    move-result v3

    .line 298
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 299
    .line 300
    .line 301
    move-result v4

    .line 302
    add-int/2addr v8, v4

    .line 303
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 304
    .line 305
    .line 306
    move-result v4

    .line 307
    add-int/2addr v7, v4

    .line 308
    if-lez v3, :cond_2a

    .line 309
    .line 310
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 311
    .line 312
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 313
    .line 314
    .line 315
    move-result-object v4

    .line 316
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 317
    .line 318
    if-ne v4, v6, :cond_e

    .line 319
    .line 320
    move v4, v5

    .line 321
    goto :goto_6

    .line 322
    :cond_e
    move v4, v11

    .line 323
    :goto_6
    iget-object v12, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 324
    .line 325
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 326
    .line 327
    .line 328
    move-result-object v12

    .line 329
    if-ne v12, v6, :cond_f

    .line 330
    .line 331
    move v6, v5

    .line 332
    goto :goto_7

    .line 333
    :cond_f
    move v6, v11

    .line 334
    :goto_7
    iget-object v12, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 335
    .line 336
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 337
    .line 338
    .line 339
    move-result v12

    .line 340
    iget v13, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 341
    .line 342
    invoke-static {v12, v13}, Ljava/lang/Math;->max(II)I

    .line 343
    .line 344
    .line 345
    move-result v12

    .line 346
    iget-object v13, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 347
    .line 348
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 349
    .line 350
    .line 351
    move-result v13

    .line 352
    iget v5, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    .line 353
    .line 354
    invoke-static {v13, v5}, Ljava/lang/Math;->max(II)I

    .line 355
    .line 356
    .line 357
    move-result v5

    .line 358
    move v13, v11

    .line 359
    move/from16 v16, v12

    .line 360
    .line 361
    move v12, v13

    .line 362
    :goto_8
    const-wide/16 v17, 0x1

    .line 363
    .line 364
    if-ge v12, v3, :cond_20

    .line 365
    .line 366
    iget-object v15, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    .line 367
    .line 368
    invoke-virtual {v15, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 369
    .line 370
    .line 371
    move-result-object v15

    .line 372
    check-cast v15, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 373
    .line 374
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m()Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    move-result-object v19

    .line 378
    move/from16 v20, v4

    .line 379
    .line 380
    move-object/from16 v4, v19

    .line 381
    .line 382
    check-cast v4, Landroid/view/View;

    .line 383
    .line 384
    if-nez v4, :cond_10

    .line 385
    .line 386
    move/from16 v21, v6

    .line 387
    .line 388
    move/from16 v23, v7

    .line 389
    .line 390
    move/from16 v19, v12

    .line 391
    .line 392
    :goto_9
    move/from16 v22, v13

    .line 393
    .line 394
    :goto_a
    move/from16 v13, v16

    .line 395
    .line 396
    goto/16 :goto_12

    .line 397
    .line 398
    :cond_10
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 399
    .line 400
    .line 401
    move-result-object v19

    .line 402
    move/from16 v21, v6

    .line 403
    .line 404
    move-object/from16 v6, v19

    .line 405
    .line 406
    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 407
    .line 408
    move/from16 v19, v12

    .line 409
    .line 410
    iget-boolean v12, v6, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Z:Z

    .line 411
    .line 412
    if-nez v12, :cond_11

    .line 413
    .line 414
    iget-boolean v12, v6, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Y:Z

    .line 415
    .line 416
    if-eqz v12, :cond_12

    .line 417
    .line 418
    :cond_11
    move/from16 v23, v7

    .line 419
    .line 420
    goto :goto_9

    .line 421
    :cond_12
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    .line 422
    .line 423
    .line 424
    move-result v12

    .line 425
    move/from16 v22, v13

    .line 426
    .line 427
    const/16 v13, 0x8

    .line 428
    .line 429
    if-ne v12, v13, :cond_13

    .line 430
    .line 431
    :goto_b
    move/from16 v23, v7

    .line 432
    .line 433
    goto :goto_a

    .line 434
    :cond_13
    if-eqz v14, :cond_14

    .line 435
    .line 436
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 437
    .line 438
    .line 439
    move-result-object v12

    .line 440
    invoke-virtual {v12}, Ll/s3d0;->d()Z

    .line 441
    .line 442
    .line 443
    move-result v12

    .line 444
    if-eqz v12, :cond_14

    .line 445
    .line 446
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 447
    .line 448
    .line 449
    move-result-object v12

    .line 450
    invoke-virtual {v12}, Ll/s3d0;->d()Z

    .line 451
    .line 452
    .line 453
    move-result v12

    .line 454
    if-eqz v12, :cond_14

    .line 455
    .line 456
    goto :goto_b

    .line 457
    :cond_14
    iget v12, v6, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 458
    .line 459
    const/4 v13, -0x2

    .line 460
    if-ne v12, v13, :cond_15

    .line 461
    .line 462
    iget-boolean v13, v6, Landroidx/constraintlayout/widget/ConstraintLayout$a;->V:Z

    .line 463
    .line 464
    if-eqz v13, :cond_15

    .line 465
    .line 466
    invoke-static {v1, v7, v12}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 467
    .line 468
    .line 469
    move-result v12

    .line 470
    goto :goto_c

    .line 471
    :cond_15
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 472
    .line 473
    .line 474
    move-result v12

    .line 475
    const/high16 v13, 0x40000000    # 2.0f

    .line 476
    .line 477
    invoke-static {v12, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 478
    .line 479
    .line 480
    move-result v12

    .line 481
    :goto_c
    iget v13, v6, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 482
    .line 483
    move/from16 v23, v7

    .line 484
    .line 485
    const/4 v7, -0x2

    .line 486
    if-ne v13, v7, :cond_16

    .line 487
    .line 488
    iget-boolean v7, v6, Landroidx/constraintlayout/widget/ConstraintLayout$a;->W:Z

    .line 489
    .line 490
    if-eqz v7, :cond_16

    .line 491
    .line 492
    invoke-static {v2, v8, v13}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 493
    .line 494
    .line 495
    move-result v7

    .line 496
    goto :goto_d

    .line 497
    :cond_16
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 498
    .line 499
    .line 500
    move-result v7

    .line 501
    const/high16 v13, 0x40000000    # 2.0f

    .line 502
    .line 503
    invoke-static {v7, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 504
    .line 505
    .line 506
    move-result v7

    .line 507
    :goto_d
    invoke-virtual {v4, v12, v7}, Landroid/view/View;->measure(II)V

    .line 508
    .line 509
    .line 510
    iget-object v7, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMetrics:Ll/pa00;

    .line 511
    .line 512
    if-eqz v7, :cond_17

    .line 513
    .line 514
    iget-wide v12, v7, Ll/pa00;->b:J

    .line 515
    .line 516
    add-long v12, v12, v17

    .line 517
    .line 518
    iput-wide v12, v7, Ll/pa00;->b:J

    .line 519
    .line 520
    :cond_17
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 521
    .line 522
    .line 523
    move-result v7

    .line 524
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    .line 525
    .line 526
    .line 527
    move-result v12

    .line 528
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 529
    .line 530
    .line 531
    move-result v13

    .line 532
    if-eq v7, v13, :cond_1b

    .line 533
    .line 534
    invoke-virtual {v15, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 535
    .line 536
    .line 537
    if-eqz v14, :cond_18

    .line 538
    .line 539
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 540
    .line 541
    .line 542
    move-result-object v13

    .line 543
    invoke-virtual {v13, v7}, Ll/r3d0;->h(I)V

    .line 544
    .line 545
    .line 546
    :cond_18
    if-eqz v20, :cond_1a

    .line 547
    .line 548
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y()I

    .line 549
    .line 550
    .line 551
    move-result v7

    .line 552
    move/from16 v13, v16

    .line 553
    .line 554
    if-le v7, v13, :cond_19

    .line 555
    .line 556
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y()I

    .line 557
    .line 558
    .line 559
    move-result v7

    .line 560
    move-object/from16 v16, v4

    .line 561
    .line 562
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 563
    .line 564
    invoke-virtual {v15, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 565
    .line 566
    .line 567
    move-result-object v4

    .line 568
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 569
    .line 570
    .line 571
    move-result v4

    .line 572
    add-int/2addr v7, v4

    .line 573
    invoke-static {v13, v7}, Ljava/lang/Math;->max(II)I

    .line 574
    .line 575
    .line 576
    move-result v4

    .line 577
    move v13, v4

    .line 578
    goto :goto_f

    .line 579
    :cond_19
    :goto_e
    move-object/from16 v16, v4

    .line 580
    .line 581
    goto :goto_f

    .line 582
    :cond_1a
    move/from16 v13, v16

    .line 583
    .line 584
    goto :goto_e

    .line 585
    :goto_f
    const/16 v22, 0x1

    .line 586
    .line 587
    goto :goto_10

    .line 588
    :cond_1b
    move/from16 v13, v16

    .line 589
    .line 590
    move-object/from16 v16, v4

    .line 591
    .line 592
    :goto_10
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 593
    .line 594
    .line 595
    move-result v4

    .line 596
    if-eq v12, v4, :cond_1e

    .line 597
    .line 598
    invoke-virtual {v15, v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 599
    .line 600
    .line 601
    if-eqz v14, :cond_1c

    .line 602
    .line 603
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 604
    .line 605
    .line 606
    move-result-object v4

    .line 607
    invoke-virtual {v4, v12}, Ll/r3d0;->h(I)V

    .line 608
    .line 609
    .line 610
    :cond_1c
    if-eqz v21, :cond_1d

    .line 611
    .line 612
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l()I

    .line 613
    .line 614
    .line 615
    move-result v4

    .line 616
    if-le v4, v5, :cond_1d

    .line 617
    .line 618
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l()I

    .line 619
    .line 620
    .line 621
    move-result v4

    .line 622
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 623
    .line 624
    invoke-virtual {v15, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 625
    .line 626
    .line 627
    move-result-object v7

    .line 628
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 629
    .line 630
    .line 631
    move-result v7

    .line 632
    add-int/2addr v4, v7

    .line 633
    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    .line 634
    .line 635
    .line 636
    move-result v5

    .line 637
    :cond_1d
    move v4, v5

    .line 638
    const/4 v5, 0x1

    .line 639
    goto :goto_11

    .line 640
    :cond_1e
    move v4, v5

    .line 641
    move/from16 v5, v22

    .line 642
    .line 643
    :goto_11
    iget-boolean v6, v6, Landroidx/constraintlayout/widget/ConstraintLayout$a;->X:Z

    .line 644
    .line 645
    if-eqz v6, :cond_1f

    .line 646
    .line 647
    invoke-virtual/range {v16 .. v16}, Landroid/view/View;->getBaseline()I

    .line 648
    .line 649
    .line 650
    move-result v6

    .line 651
    const/4 v7, -0x1

    .line 652
    if-eq v6, v7, :cond_1f

    .line 653
    .line 654
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j()I

    .line 655
    .line 656
    .line 657
    move-result v7

    .line 658
    if-eq v6, v7, :cond_1f

    .line 659
    .line 660
    invoke-virtual {v15, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V(I)V

    .line 661
    .line 662
    .line 663
    const/4 v5, 0x1

    .line 664
    :cond_1f
    invoke-virtual/range {v16 .. v16}, Landroid/view/View;->getMeasuredState()I

    .line 665
    .line 666
    .line 667
    move-result v6

    .line 668
    invoke-static {v11, v6}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 669
    .line 670
    .line 671
    move-result v6

    .line 672
    move v11, v6

    .line 673
    move/from16 v16, v13

    .line 674
    .line 675
    move v13, v5

    .line 676
    move v5, v4

    .line 677
    goto :goto_13

    .line 678
    :goto_12
    move/from16 v16, v13

    .line 679
    .line 680
    move/from16 v13, v22

    .line 681
    .line 682
    :goto_13
    add-int/lit8 v12, v19, 0x1

    .line 683
    .line 684
    move/from16 v4, v20

    .line 685
    .line 686
    move/from16 v6, v21

    .line 687
    .line 688
    move/from16 v7, v23

    .line 689
    .line 690
    const/high16 v15, 0x40000000    # 2.0f

    .line 691
    .line 692
    goto/16 :goto_8

    .line 693
    .line 694
    :cond_20
    move/from16 v23, v7

    .line 695
    .line 696
    move/from16 v22, v13

    .line 697
    .line 698
    move/from16 v13, v16

    .line 699
    .line 700
    if-eqz v22, :cond_24

    .line 701
    .line 702
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 703
    .line 704
    invoke-virtual {v4, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 705
    .line 706
    .line 707
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 708
    .line 709
    invoke-virtual {v4, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 710
    .line 711
    .line 712
    if-eqz v14, :cond_21

    .line 713
    .line 714
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 715
    .line 716
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/e;->f1()V

    .line 717
    .line 718
    .line 719
    :cond_21
    const-string v4, "2nd pass"

    .line 720
    .line 721
    invoke-virtual {v0, v4}, Landroidx/constraintlayout/widget/ConstraintLayout;->solveLinearSystem(Ljava/lang/String;)V

    .line 722
    .line 723
    .line 724
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 725
    .line 726
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 727
    .line 728
    .line 729
    move-result v4

    .line 730
    if-ge v4, v13, :cond_22

    .line 731
    .line 732
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 733
    .line 734
    invoke-virtual {v4, v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 735
    .line 736
    .line 737
    const/4 v4, 0x1

    .line 738
    goto :goto_14

    .line 739
    :cond_22
    const/4 v4, 0x0

    .line 740
    :goto_14
    iget-object v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 741
    .line 742
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 743
    .line 744
    .line 745
    move-result v6

    .line 746
    if-ge v6, v5, :cond_23

    .line 747
    .line 748
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 749
    .line 750
    invoke-virtual {v4, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 751
    .line 752
    .line 753
    const/4 v12, 0x1

    .line 754
    goto :goto_15

    .line 755
    :cond_23
    move v12, v4

    .line 756
    :goto_15
    if-eqz v12, :cond_24

    .line 757
    .line 758
    const-string v4, "3rd pass"

    .line 759
    .line 760
    invoke-virtual {v0, v4}, Landroidx/constraintlayout/widget/ConstraintLayout;->solveLinearSystem(Ljava/lang/String;)V

    .line 761
    .line 762
    .line 763
    :cond_24
    const/4 v4, 0x0

    .line 764
    :goto_16
    if-ge v4, v3, :cond_2b

    .line 765
    .line 766
    iget-object v5, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    .line 767
    .line 768
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 769
    .line 770
    .line 771
    move-result-object v5

    .line 772
    check-cast v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 773
    .line 774
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m()Ljava/lang/Object;

    .line 775
    .line 776
    .line 777
    move-result-object v6

    .line 778
    check-cast v6, Landroid/view/View;

    .line 779
    .line 780
    if-nez v6, :cond_26

    .line 781
    .line 782
    :cond_25
    const/high16 v9, 0x40000000    # 2.0f

    .line 783
    .line 784
    const/16 v13, 0x8

    .line 785
    .line 786
    goto :goto_17

    .line 787
    :cond_26
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    .line 788
    .line 789
    .line 790
    move-result v7

    .line 791
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 792
    .line 793
    .line 794
    move-result v9

    .line 795
    if-ne v7, v9, :cond_27

    .line 796
    .line 797
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    .line 798
    .line 799
    .line 800
    move-result v7

    .line 801
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 802
    .line 803
    .line 804
    move-result v9

    .line 805
    if-eq v7, v9, :cond_25

    .line 806
    .line 807
    :cond_27
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    .line 808
    .line 809
    .line 810
    move-result v7

    .line 811
    const/16 v13, 0x8

    .line 812
    .line 813
    if-eq v7, v13, :cond_28

    .line 814
    .line 815
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 816
    .line 817
    .line 818
    move-result v7

    .line 819
    const/high16 v9, 0x40000000    # 2.0f

    .line 820
    .line 821
    invoke-static {v7, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 822
    .line 823
    .line 824
    move-result v7

    .line 825
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 826
    .line 827
    .line 828
    move-result v5

    .line 829
    invoke-static {v5, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 830
    .line 831
    .line 832
    move-result v5

    .line 833
    invoke-virtual {v6, v7, v5}, Landroid/view/View;->measure(II)V

    .line 834
    .line 835
    .line 836
    iget-object v5, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMetrics:Ll/pa00;

    .line 837
    .line 838
    if-eqz v5, :cond_29

    .line 839
    .line 840
    iget-wide v6, v5, Ll/pa00;->b:J

    .line 841
    .line 842
    add-long v6, v6, v17

    .line 843
    .line 844
    iput-wide v6, v5, Ll/pa00;->b:J

    .line 845
    .line 846
    goto :goto_17

    .line 847
    :cond_28
    const/high16 v9, 0x40000000    # 2.0f

    .line 848
    .line 849
    :cond_29
    :goto_17
    add-int/lit8 v4, v4, 0x1

    .line 850
    .line 851
    goto :goto_16

    .line 852
    :cond_2a
    move/from16 v23, v7

    .line 853
    .line 854
    const/4 v11, 0x0

    .line 855
    :cond_2b
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 856
    .line 857
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 858
    .line 859
    .line 860
    move-result v3

    .line 861
    add-int v3, v3, v23

    .line 862
    .line 863
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 864
    .line 865
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 866
    .line 867
    .line 868
    move-result v4

    .line 869
    add-int/2addr v4, v8

    .line 870
    invoke-static {v3, v1, v11}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 871
    .line 872
    .line 873
    move-result v1

    .line 874
    shl-int/lit8 v3, v11, 0x10

    .line 875
    .line 876
    invoke-static {v4, v2, v3}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 877
    .line 878
    .line 879
    move-result v2

    .line 880
    const v3, 0xffffff

    .line 881
    .line 882
    .line 883
    and-int/2addr v1, v3

    .line 884
    and-int/2addr v2, v3

    .line 885
    iget v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 886
    .line 887
    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    .line 888
    .line 889
    .line 890
    move-result v1

    .line 891
    iget v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    .line 892
    .line 893
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    .line 894
    .line 895
    .line 896
    move-result v2

    .line 897
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 898
    .line 899
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/e;->W0()Z

    .line 900
    .line 901
    .line 902
    move-result v3

    .line 903
    const/high16 v4, 0x1000000

    .line 904
    .line 905
    if-eqz v3, :cond_2c

    .line 906
    .line 907
    or-int/2addr v1, v4

    .line 908
    :cond_2c
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 909
    .line 910
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/e;->U0()Z

    .line 911
    .line 912
    .line 913
    move-result v3

    .line 914
    if-eqz v3, :cond_2d

    .line 915
    .line 916
    or-int/2addr v2, v4

    .line 917
    :cond_2d
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 918
    .line 919
    .line 920
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidth:I

    .line 921
    .line 922
    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeight:I

    .line 923
    .line 924
    return-void
.end method

.method public onViewAdded(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewAdded(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewWidget(Landroid/view/View;)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v1, p1, Landroidx/constraintlayout/widget/Guideline;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    instance-of v0, v0, Landroidx/constraintlayout/solver/widgets/g;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 22
    .line 23
    new-instance v1, Landroidx/constraintlayout/solver/widgets/g;

    .line 24
    .line 25
    invoke-direct {v1}, Landroidx/constraintlayout/solver/widgets/g;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->l0:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 29
    .line 30
    iput-boolean v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Y:Z

    .line 31
    .line 32
    iget v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->S:I

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/g;->M0(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    instance-of v0, p1, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    move-object v0, p1

    .line 42
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroidx/constraintlayout/widget/ConstraintHelper;->f()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 52
    .line 53
    iput-boolean v2, v1, Landroidx/constraintlayout/widget/ConstraintLayout$a;->Z:Z

    .line 54
    .line 55
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_1

    .line 62
    .line 63
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-virtual {v0, v1, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    iput-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    .line 78
    .line 79
    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewRemoved(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewWidget(Landroid/view/View;)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ll/jfq0;->L0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    iput-boolean p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    .line 34
    .line 35
    return-void
.end method

.method public removeView(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public requestLayout()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidth:I

    .line 9
    .line 10
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeight:I

    .line 11
    .line 12
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidthSize:I

    .line 13
    .line 14
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeightSize:I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureWidthMode:I

    .line 18
    .line 19
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLastMeasureHeightMode:I

    .line 20
    .line 21
    return-void
.end method

.method public setConstraintSet(Landroidx/constraintlayout/widget/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/a;

    .line 2
    .line 3
    return-void
.end method

.method public setDesignInformation(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    if-nez p1, :cond_2

    .line 2
    .line 3
    instance-of p1, p2, Ljava/lang/String;

    .line 4
    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    instance-of p1, p3, Ljava/lang/Integer;

    .line 8
    .line 9
    if-eqz p1, :cond_2

    .line 10
    .line 11
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    new-instance p1, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 21
    .line 22
    :cond_0
    check-cast p2, Ljava/lang/String;

    .line 23
    .line 24
    const-string p1, "/"

    .line 25
    .line 26
    invoke-virtual {p2, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 v0, -0x1

    .line 31
    if-eq p1, v0, :cond_1

    .line 32
    .line 33
    add-int/lit8 p1, p1, 0x1

    .line 34
    .line 35
    invoke-virtual {p2, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    :cond_1
    check-cast p3, Ljava/lang/Integer;

    .line 40
    .line 41
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 42
    .line 43
    invoke-virtual {p0, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    :cond_2
    return-void
.end method

.method public setId(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0, p1}, Landroid/view/View;->setId(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1, v0, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setMaxHeight(I)V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setMaxWidth(I)V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setMinHeight(I)V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setMinWidth(I)V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setOptimizationLevel(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/e;->d1(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public solveLinearSystem(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/e;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/e;->K0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMetrics:Ll/pa00;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    iget-wide v0, p0, Ll/pa00;->c:J

    .line 11
    .line 12
    const-wide/16 v2, 0x1

    .line 13
    .line 14
    add-long/2addr v0, v2

    .line 15
    iput-wide v0, p0, Ll/pa00;->c:J

    .line 16
    .line 17
    :cond_0
    return-void
.end method
