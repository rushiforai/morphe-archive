.class public Lcom/flipboard/bottomsheet/BottomSheetLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flipboard/bottomsheet/BottomSheetLayout$j;,
        Lcom/flipboard/bottomsheet/BottomSheetLayout$State;,
        Lcom/flipboard/bottomsheet/BottomSheetLayout$i;,
        Lcom/flipboard/bottomsheet/BottomSheetLayout$h;
    }
.end annotation


# static fields
.field private static final I:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/flipboard/bottomsheet/BottomSheetLayout;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final A:Z

.field private final B:I

.field private C:I

.field private D:I

.field private E:F

.field private F:F

.field private G:F

.field private H:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

.field private a:Ljava/lang/Runnable;

.field private b:Landroid/graphics/Rect;

.field private c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

.field private d:Z

.field private e:Landroid/animation/TimeInterpolator;

.field public f:Z

.field private g:Z

.field private h:F

.field private i:Landroid/view/VelocityTracker;

.field private j:F

.field private k:F

.field private l:Ll/nml0;

.field private m:Ll/nml0;

.field private n:Z

.field private o:Z

.field private p:Landroid/animation/Animator;

.field private q:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Ll/qn50;",
            ">;"
        }
    .end annotation
.end field

.field private r:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Lcom/flipboard/bottomsheet/BottomSheetLayout$j;",
            ">;"
        }
    .end annotation
.end field

.field private s:Landroid/view/View$OnLayoutChangeListener;

.field private t:Landroid/view/View;

.field private u:Z

.field private v:I

.field private w:Z

.field private x:F

.field private y:F

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$a;

    .line 2
    .line 3
    const-class v1, Ljava/lang/Float;

    .line 4
    .line 5
    const-string v2, "sheetTranslation"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/flipboard/bottomsheet/BottomSheetLayout$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->I:Landroid/util/Property;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->b:Landroid/graphics/Rect;

    .line 10
    .line 11
    sget-object p1, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->HIDDEN:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->d:Z

    .line 17
    .line 18
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 19
    .line 20
    const v1, 0x3fcccccd    # 1.6f

    .line 21
    .line 22
    .line 23
    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->e:Landroid/animation/TimeInterpolator;

    .line 27
    .line 28
    new-instance v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$i;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-direct {v0, v1}, Lcom/flipboard/bottomsheet/BottomSheetLayout$i;-><init>(Lcom/flipboard/bottomsheet/BottomSheetLayout$a;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->l:Ll/nml0;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->n:Z

    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->o:Z

    .line 40
    .line 41
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->q:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 47
    .line 48
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 49
    .line 50
    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->r:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 54
    .line 55
    iput-boolean v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->u:Z

    .line 56
    .line 57
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->z:I

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sget v1, Ll/w8c0;->a:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iput-boolean v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->A:Z

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sget v1, Ll/nac0;->a:I

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->B:I

    .line 82
    .line 83
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->C:I

    .line 84
    .line 85
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->D:I

    .line 86
    .line 87
    invoke-direct {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->w()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 91
    invoke-direct {p0, p1, p2, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 92
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 93
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->b:Landroid/graphics/Rect;

    .line 94
    sget-object p1, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->HIDDEN:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    const/4 p1, 0x0

    .line 95
    iput-boolean p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->d:Z

    .line 96
    new-instance p2, Landroid/view/animation/DecelerateInterpolator;

    const p3, 0x3fcccccd    # 1.6f

    invoke-direct {p2, p3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->e:Landroid/animation/TimeInterpolator;

    .line 97
    new-instance p2, Lcom/flipboard/bottomsheet/BottomSheetLayout$i;

    const/4 p3, 0x0

    invoke-direct {p2, p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout$i;-><init>(Lcom/flipboard/bottomsheet/BottomSheetLayout$a;)V

    iput-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->l:Ll/nml0;

    const/4 p2, 0x1

    .line 98
    iput-boolean p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->n:Z

    .line 99
    iput-boolean p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->o:Z

    .line 100
    new-instance p3, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {p3}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object p3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->q:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 101
    new-instance p3, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {p3}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object p3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->r:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 102
    iput-boolean p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->u:Z

    .line 103
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->z:I

    .line 104
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Ll/w8c0;->a:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p2

    iput-boolean p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->A:Z

    .line 105
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Ll/nac0;->a:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->B:I

    .line 106
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->C:I

    .line 107
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->D:I

    .line 108
    invoke-direct {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->w()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 109
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 110
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->b:Landroid/graphics/Rect;

    .line 111
    sget-object p1, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->HIDDEN:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    const/4 p1, 0x0

    .line 112
    iput-boolean p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->d:Z

    .line 113
    new-instance p2, Landroid/view/animation/DecelerateInterpolator;

    const p3, 0x3fcccccd    # 1.6f

    invoke-direct {p2, p3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->e:Landroid/animation/TimeInterpolator;

    .line 114
    new-instance p2, Lcom/flipboard/bottomsheet/BottomSheetLayout$i;

    const/4 p3, 0x0

    invoke-direct {p2, p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout$i;-><init>(Lcom/flipboard/bottomsheet/BottomSheetLayout$a;)V

    iput-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->l:Ll/nml0;

    const/4 p2, 0x1

    .line 115
    iput-boolean p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->n:Z

    .line 116
    iput-boolean p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->o:Z

    .line 117
    new-instance p3, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {p3}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object p3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->q:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 118
    new-instance p3, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {p3}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object p3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->r:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 119
    iput-boolean p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->u:Z

    .line 120
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->z:I

    .line 121
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Ll/w8c0;->a:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p2

    iput-boolean p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->A:Z

    .line 122
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Ll/nac0;->a:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->B:I

    .line 123
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->C:I

    .line 124
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->D:I

    .line 125
    invoke-direct {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->w()V

    return-void
.end method

.method private A(F)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->A:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->C:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    cmpl-float v0, p1, v0

    .line 9
    .line 10
    if-ltz v0, :cond_0

    .line 11
    .line 12
    iget p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->D:I

    .line 13
    .line 14
    int-to-float p0, p0

    .line 15
    cmpg-float p0, p1, p0

    .line 16
    .line 17
    if-gtz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method private E(F)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->m:Ll/nml0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getMaxSheetTranslation()F

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getPeekSheetTranslation()F

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getContentView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    move-object v4, p0

    .line 18
    move v1, p1

    .line 19
    invoke-interface/range {v0 .. v5}, Ll/nml0;->b(FFFLcom/flipboard/bottomsheet/BottomSheetLayout;Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    move-object v4, p0

    .line 24
    move v1, p1

    .line 25
    iget-object v6, v4, Lcom/flipboard/bottomsheet/BottomSheetLayout;->l:Ll/nml0;

    .line 26
    .line 27
    if-eqz v6, :cond_1

    .line 28
    .line 29
    invoke-virtual {v4}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getMaxSheetTranslation()F

    .line 30
    .line 31
    .line 32
    move-result v8

    .line 33
    invoke-virtual {v4}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getPeekSheetTranslation()F

    .line 34
    .line 35
    .line 36
    move-result v9

    .line 37
    invoke-virtual {v4}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getContentView()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v11

    .line 41
    move v7, v1

    .line 42
    move-object v10, v4

    .line 43
    invoke-interface/range {v6 .. v11}, Ll/nml0;->b(FFFLcom/flipboard/bottomsheet/BottomSheetLayout;Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public static synthetic a(Lcom/flipboard/bottomsheet/BottomSheetLayout;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lcom/flipboard/bottomsheet/BottomSheetLayout;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setSheetTranslation(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/flipboard/bottomsheet/BottomSheetLayout;Ll/nml0;)Ll/nml0;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->m:Ll/nml0;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic d(Lcom/flipboard/bottomsheet/BottomSheetLayout;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/flipboard/bottomsheet/BottomSheetLayout;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic f(Lcom/flipboard/bottomsheet/BottomSheetLayout;Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->p:Landroid/animation/Animator;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic g(Lcom/flipboard/bottomsheet/BottomSheetLayout;)Lcom/flipboard/bottomsheet/BottomSheetLayout$State;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 2
    .line 3
    return-object p0
.end method

.method private getDefaultPeekTranslation()F
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->x:F

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    int-to-float p0, p0

    .line 19
    return p0
.end method

.method public static synthetic h(Lcom/flipboard/bottomsheet/BottomSheetLayout;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i(Lcom/flipboard/bottomsheet/BottomSheetLayout;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->v:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic j(Lcom/flipboard/bottomsheet/BottomSheetLayout;Lcom/flipboard/bottomsheet/BottomSheetLayout$State;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setState(Lcom/flipboard/bottomsheet/BottomSheetLayout$State;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/flipboard/bottomsheet/BottomSheetLayout;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setSheetLayerTypeIfEnabled(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/flipboard/bottomsheet/BottomSheetLayout;)Ljava/util/concurrent/CopyOnWriteArraySet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->q:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 2
    .line 3
    return-object p0
.end method

.method private n(Landroid/view/View;FF)Z
    .locals 8

    .line 1
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v1, v2, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    sub-int/2addr v3, v4

    .line 28
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    sub-int/2addr v4, v5

    .line 37
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    .line 42
    .line 43
    .line 44
    move-result v6

    .line 45
    sub-int/2addr v5, v6

    .line 46
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    sub-int/2addr v6, v7

    .line 55
    int-to-float v3, v3

    .line 56
    cmpl-float v7, p2, v3

    .line 57
    .line 58
    if-lez v7, :cond_0

    .line 59
    .line 60
    int-to-float v5, v5

    .line 61
    cmpg-float v5, p2, v5

    .line 62
    .line 63
    if-gez v5, :cond_0

    .line 64
    .line 65
    int-to-float v5, v4

    .line 66
    cmpl-float v5, p3, v5

    .line 67
    .line 68
    if-lez v5, :cond_0

    .line 69
    .line 70
    int-to-float v5, v6

    .line 71
    cmpg-float v5, p3, v5

    .line 72
    .line 73
    if-gez v5, :cond_0

    .line 74
    .line 75
    sub-float v3, p2, v3

    .line 76
    .line 77
    int-to-float v4, v4

    .line 78
    sub-float v4, p3, v4

    .line 79
    .line 80
    invoke-direct {p0, v2, v3, v4}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->n(Landroid/view/View;FF)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_0

    .line 85
    .line 86
    const/4 p0, 0x1

    .line 87
    return p0

    .line 88
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    const/4 p0, -0x1

    .line 92
    invoke-virtual {p1, p0}, Landroid/view/View;->canScrollVertically(I)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    return p0
.end method

.method private o()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->p:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private static p(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    invoke-static {p1}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0
.end method

.method private r(Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 2
    .line 3
    sget-object v1, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->HIDDEN:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->a:Ljava/lang/Runnable;

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->a:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->s:Landroid/view/View$OnLayoutChangeListener;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->o()V

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->I:Landroid/util/Property;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    new-array v1, v1, [F

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    const/4 v3, 0x0

    .line 32
    aput v2, v1, v3

    .line 33
    .line 34
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-wide/16 v1, 0x12c

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->e:Landroid/animation/TimeInterpolator;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 46
    .line 47
    .line 48
    new-instance v1, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;

    .line 49
    .line 50
    invoke-direct {v1, p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;-><init>(Lcom/flipboard/bottomsheet/BottomSheetLayout;Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->p:Landroid/animation/Animator;

    .line 60
    .line 61
    iput v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->C:I

    .line 62
    .line 63
    iget p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->z:I

    .line 64
    .line 65
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->D:I

    .line 66
    .line 67
    return-void
.end method

.method private setSheetLayerTypeIfEnabled(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private setSheetTranslation(F)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getMaxSheetTranslation()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    int-to-double v0, p1

    .line 16
    iget p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 17
    .line 18
    float-to-double v2, p1

    .line 19
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    sub-double/2addr v0, v2

    .line 24
    double-to-int p1, v0

    .line 25
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->b:Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {v0, v2, v2, v1, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    int-to-float v0, v0

    .line 44
    iget v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 45
    .line 46
    sub-float/2addr v0, v1

    .line 47
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 48
    .line 49
    .line 50
    iget p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 51
    .line 52
    invoke-direct {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->E(F)V

    .line 53
    .line 54
    .line 55
    iget-boolean p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->n:Z

    .line 56
    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    iget p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 60
    .line 61
    invoke-direct {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->t(F)F

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->t:Landroid/view/View;

    .line 66
    .line 67
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->t:Landroid/view/View;

    .line 71
    .line 72
    const/4 v0, 0x0

    .line 73
    cmpl-float p1, p1, v0

    .line 74
    .line 75
    if-lez p1, :cond_0

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    const/4 v2, 0x4

    .line 79
    :goto_0
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method private setState(Lcom/flipboard/bottomsheet/BottomSheetLayout$State;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->r:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$j;

    .line 24
    .line 25
    invoke-interface {v0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout$j;->a(Lcom/flipboard/bottomsheet/BottomSheetLayout$State;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method private t(F)F
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->m:Ll/nml0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getMaxSheetTranslation()F

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getPeekSheetTranslation()F

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getContentView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    move-object v4, p0

    .line 18
    move v1, p1

    .line 19
    invoke-interface/range {v0 .. v5}, Ll/nml0;->a(FFFLcom/flipboard/bottomsheet/BottomSheetLayout;Landroid/view/View;)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    move-object v4, p0

    .line 25
    move v1, p1

    .line 26
    iget-object v0, v4, Lcom/flipboard/bottomsheet/BottomSheetLayout;->l:Ll/nml0;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v4}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getMaxSheetTranslation()F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v4}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getPeekSheetTranslation()F

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    invoke-virtual {v4}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getContentView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-interface/range {v0 .. v5}, Ll/nml0;->a(FFFLcom/flipboard/bottomsheet/BottomSheetLayout;Landroid/view/View;)F

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0

    .line 47
    :cond_1
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method private u()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-ne v0, p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method private v()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    iget p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->x:F

    .line 17
    .line 18
    cmpl-float p0, v0, p0

    .line 19
    .line 20
    if-lez p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 26
    return p0
.end method

.method private w()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    iput v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->j:F

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v0, v0

    .line 21
    iput v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->k:F

    .line 22
    .line 23
    new-instance v0, Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->t:Landroid/view/View;

    .line 33
    .line 34
    const/high16 v1, -0x1000000

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->t:Landroid/view/View;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->t:Landroid/view/View;

    .line 46
    .line 47
    const/4 v2, 0x4

    .line 48
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    const/4 v0, 0x1

    .line 52
    invoke-virtual {p0, v0}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 53
    .line 54
    .line 55
    new-instance v0, Landroid/graphics/Point;

    .line 56
    .line 57
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const-string v3, "window"

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Landroid/view/WindowManager;

    .line 71
    .line 72
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v2, v0}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 77
    .line 78
    .line 79
    iget v2, v0, Landroid/graphics/Point;->x:I

    .line 80
    .line 81
    iput v2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->z:I

    .line 82
    .line 83
    iput v2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->D:I

    .line 84
    .line 85
    iput v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->y:F

    .line 86
    .line 87
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 88
    .line 89
    int-to-float v0, v0

    .line 90
    int-to-float v1, v2

    .line 91
    const v2, 0x3fe38e39

    .line 92
    .line 93
    .line 94
    div-float/2addr v1, v2

    .line 95
    sub-float/2addr v0, v1

    .line 96
    iput v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->x:F

    .line 97
    .line 98
    return-void
.end method

.method private x()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 3
    .line 4
    iget-object v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->b:Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    const/4 v4, 0x0

    .line 15
    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    int-to-float v2, v2

    .line 27
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->t:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->t:Landroid/view/View;

    .line 36
    .line 37
    const/4 v0, 0x4

    .line 38
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private y()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->p:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method


# virtual methods
.method public B()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->o()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    invoke-direct {p0, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setSheetLayerTypeIfEnabled(I)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->I:Landroid/util/Property;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getPeekSheetTranslation()F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    new-array v2, v2, [F

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    aput v1, v2, v3

    .line 19
    .line 20
    invoke-static {p0, v0, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-wide/16 v1, 0x12c

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->e:Landroid/animation/TimeInterpolator;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 32
    .line 33
    .line 34
    new-instance v1, Lcom/flipboard/bottomsheet/BottomSheetLayout$c;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout$c;-><init>(Lcom/flipboard/bottomsheet/BottomSheetLayout;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->p:Landroid/animation/Animator;

    .line 46
    .line 47
    sget-object v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->PEEKED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 48
    .line 49
    invoke-direct {p0, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setState(Lcom/flipboard/bottomsheet/BottomSheetLayout$State;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public C(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->D(Landroid/view/View;Ll/nml0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public D(Landroid/view/View;Ll/nml0;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 2
    .line 3
    sget-object v1, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->HIDDEN:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$d;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Lcom/flipboard/bottomsheet/BottomSheetLayout$d;-><init>(Lcom/flipboard/bottomsheet/BottomSheetLayout;Landroid/view/View;Ll/nml0;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->r(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->PREPARING:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 17
    .line 18
    invoke-direct {p0, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setState(Lcom/flipboard/bottomsheet/BottomSheetLayout$State;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    const/4 v2, -0x1

    .line 29
    const/4 v3, -0x2

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 33
    .line 34
    iget-boolean v4, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->A:Z

    .line 35
    .line 36
    if-eqz v4, :cond_1

    .line 37
    .line 38
    move v4, v3

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move v4, v2

    .line 41
    :goto_0
    invoke-direct {v0, v4, v3, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 42
    .line 43
    .line 44
    :cond_2
    iget-boolean v4, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->A:Z

    .line 45
    .line 46
    if-eqz v4, :cond_4

    .line 47
    .line 48
    iget v4, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 49
    .line 50
    if-ne v4, v3, :cond_4

    .line 51
    .line 52
    iget v3, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 53
    .line 54
    if-ne v3, v2, :cond_3

    .line 55
    .line 56
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 57
    .line 58
    :cond_3
    iget v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->B:I

    .line 59
    .line 60
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 61
    .line 62
    iget v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->z:I

    .line 63
    .line 64
    sub-int v1, v3, v1

    .line 65
    .line 66
    div-int/lit8 v1, v1, 0x2

    .line 67
    .line 68
    iput v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->C:I

    .line 69
    .line 70
    sub-int/2addr v3, v1

    .line 71
    iput v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->D:I

    .line 72
    .line 73
    :cond_4
    invoke-super {p0, p1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 74
    .line 75
    .line 76
    invoke-direct {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->x()V

    .line 77
    .line 78
    .line 79
    iput-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->m:Ll/nml0;

    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    new-instance v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$e;

    .line 86
    .line 87
    invoke-direct {v0, p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout$e;-><init>(Lcom/flipboard/bottomsheet/BottomSheetLayout;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    iput p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->v:I

    .line 98
    .line 99
    new-instance p2, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;

    .line 100
    .line 101
    invoke-direct {p2, p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;-><init>(Lcom/flipboard/bottomsheet/BottomSheetLayout;)V

    .line 102
    .line 103
    .line 104
    iput-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->s:Landroid/view/View$OnLayoutChangeListener;

    .line 105
    .line 106
    invoke-virtual {p1, p2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public addView(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setContentView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p0, "You may not declare more then one child of bottom sheet. The sheet view must be added dynamically with showWithSheetView()"

    .line 12
    .line 13
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public addView(Landroid/view/View;I)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 17
    invoke-virtual {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;II)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 20
    invoke-virtual {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/ViewGroup$LayoutParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 18
    invoke-virtual {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup$LayoutParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 19
    invoke-virtual {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method public getContentView()Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public getInterceptContentTouch()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public getMaxSheetTranslation()F
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    sub-int/2addr v0, p0

    .line 16
    int-to-float p0, v0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    int-to-float p0, p0

    .line 27
    return p0
.end method

.method public getPeekOnDismiss()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public getPeekSheetTranslation()F
    .locals 2

    .line 1
    iget v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->y:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v1, v0, v1

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getDefaultPeekTranslation()F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    return v0
.end method

.method public getSheetView()Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-le v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public getState()Lcom/flipboard/bottomsheet/BottomSheetLayout$State;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ll/qn50;)V
    .locals 1
    .param p1    # Ll/qn50;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "onSheetDismissedListener == null"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->p(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->q:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->i:Landroid/view/VelocityTracker;

    .line 9
    .line 10
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->i:Landroid/view/VelocityTracker;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->o()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    move v0, v1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v2

    .line 12
    :goto_0
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iput-boolean v2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->w:Z

    .line 15
    .line 16
    :cond_1
    iget-boolean v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->u:Z

    .line 17
    .line 18
    if-nez v3, :cond_3

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    int-to-float v4, v4

    .line 29
    iget v5, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 30
    .line 31
    sub-float/2addr v4, v5

    .line 32
    cmpl-float v3, v3, v4

    .line 33
    .line 34
    if-lez v3, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-direct {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->A(F)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    iput-boolean v2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->w:Z

    .line 48
    .line 49
    goto :goto_3

    .line 50
    :cond_3
    :goto_1
    if-eqz v0, :cond_4

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->z()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_4

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_4
    move v1, v2

    .line 60
    :goto_2
    iput-boolean v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->w:Z

    .line 61
    .line 62
    :goto_3
    iget-boolean p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->w:Z

    .line 63
    .line 64
    return p0
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p2    # Landroid/view/KeyEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x4

    .line 2
    if-ne p1, v0, :cond_4

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->z()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1, p2, p0}, Landroid/view/KeyEvent$DispatcherState;->startTracking(Landroid/view/KeyEvent;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return v1

    .line 33
    :cond_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-ne v0, v1, :cond_4

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {v0, p2}, Landroid/view/KeyEvent$DispatcherState;->handleUpEvent(Landroid/view/KeyEvent;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->z()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isTracking()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isCanceled()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_4

    .line 65
    .line 66
    iget-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 67
    .line 68
    sget-object p2, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->EXPANDED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 69
    .line 70
    if-ne p1, p2, :cond_3

    .line 71
    .line 72
    iget-boolean p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->d:Z

    .line 73
    .line 74
    if-eqz p1, :cond_3

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->B()V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->q()V

    .line 81
    .line 82
    .line 83
    :goto_0
    return v1

    .line 84
    :cond_4
    invoke-super {p0, p1, p2}, Landroid/view/View;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    int-to-double p1, p1

    .line 9
    iget p3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 10
    .line 11
    float-to-double p3, p3

    .line 12
    invoke-static {p3, p4}, Ljava/lang/Math;->ceil(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide p3

    .line 16
    sub-double/2addr p1, p3

    .line 17
    double-to-int p1, p1

    .line 18
    iget-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->b:Landroid/graphics/Rect;

    .line 19
    .line 20
    const/4 p3, 0x0

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-virtual {p2, p3, p3, p0, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 13
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-direct {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->y()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    iget-boolean v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->w:Z

    .line 17
    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_3

    .line 30
    .line 31
    iput-boolean v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->f:Z

    .line 32
    .line 33
    iput-boolean v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->g:Z

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->E:F

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iput v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->F:F

    .line 46
    .line 47
    iget v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 48
    .line 49
    iput v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->G:F

    .line 50
    .line 51
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->H:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 54
    .line 55
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->i:Landroid/view/VelocityTracker;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 58
    .line 59
    .line 60
    :cond_3
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->i:Landroid/view/VelocityTracker;

    .line 61
    .line 62
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getMaxSheetTranslation()F

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getPeekSheetTranslation()F

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    iget v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->E:F

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    sub-float/2addr v3, v4

    .line 80
    iget v4, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->F:F

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    sub-float/2addr v4, v5

    .line 87
    iget-boolean v5, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->f:Z

    .line 88
    .line 89
    const/4 v6, 0x3

    .line 90
    const/4 v7, 0x0

    .line 91
    const/4 v8, 0x1

    .line 92
    if-nez v5, :cond_7

    .line 93
    .line 94
    iget-boolean v5, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->g:Z

    .line 95
    .line 96
    if-nez v5, :cond_7

    .line 97
    .line 98
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    iget v9, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->k:F

    .line 103
    .line 104
    cmpl-float v5, v5, v9

    .line 105
    .line 106
    if-lez v5, :cond_4

    .line 107
    .line 108
    move v5, v8

    .line 109
    goto :goto_0

    .line 110
    :cond_4
    move v5, v1

    .line 111
    :goto_0
    iput-boolean v5, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->f:Z

    .line 112
    .line 113
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    iget v5, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->k:F

    .line 118
    .line 119
    cmpl-float v4, v4, v5

    .line 120
    .line 121
    if-lez v4, :cond_5

    .line 122
    .line 123
    move v4, v8

    .line 124
    goto :goto_1

    .line 125
    :cond_5
    move v4, v1

    .line 126
    :goto_1
    iput-boolean v4, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->g:Z

    .line 127
    .line 128
    iget-boolean v4, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->f:Z

    .line 129
    .line 130
    if-eqz v4, :cond_7

    .line 131
    .line 132
    iget-object v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 133
    .line 134
    sget-object v4, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->PEEKED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 135
    .line 136
    if-ne v3, v4, :cond_6

    .line 137
    .line 138
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    iget v4, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 143
    .line 144
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 145
    .line 146
    .line 147
    move-result v5

    .line 148
    int-to-float v5, v5

    .line 149
    sub-float/2addr v4, v5

    .line 150
    invoke-virtual {v3, v7, v4}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3, v6}, Landroid/view/MotionEvent;->setAction(I)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    invoke-virtual {v4, v3}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 161
    .line 162
    .line 163
    invoke-virtual {v3}, Landroid/view/MotionEvent;->recycle()V

    .line 164
    .line 165
    .line 166
    :cond_6
    iput-boolean v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->g:Z

    .line 167
    .line 168
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    iput v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->E:F

    .line 173
    .line 174
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    iput v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->F:F

    .line 179
    .line 180
    move v3, v7

    .line 181
    :cond_7
    iget v4, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->G:F

    .line 182
    .line 183
    add-float/2addr v4, v3

    .line 184
    iget-boolean v5, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->f:Z

    .line 185
    .line 186
    if-eqz v5, :cond_13

    .line 187
    .line 188
    cmpg-float v3, v3, v7

    .line 189
    .line 190
    if-gez v3, :cond_8

    .line 191
    .line 192
    move v3, v8

    .line 193
    goto :goto_2

    .line 194
    :cond_8
    move v3, v1

    .line 195
    :goto_2
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v5

    .line 199
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 200
    .line 201
    .line 202
    move-result v9

    .line 203
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 204
    .line 205
    .line 206
    move-result v10

    .line 207
    iget v11, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 208
    .line 209
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 210
    .line 211
    .line 212
    move-result v12

    .line 213
    int-to-float v12, v12

    .line 214
    sub-float/2addr v11, v12

    .line 215
    add-float/2addr v10, v11

    .line 216
    invoke-direct {p0, v5, v9, v10}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->n(Landroid/view/View;FF)Z

    .line 217
    .line 218
    .line 219
    move-result v5

    .line 220
    iget-object v9, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 221
    .line 222
    sget-object v10, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->EXPANDED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 223
    .line 224
    const/4 v11, 0x2

    .line 225
    if-ne v9, v10, :cond_9

    .line 226
    .line 227
    if-eqz v3, :cond_9

    .line 228
    .line 229
    if-nez v5, :cond_9

    .line 230
    .line 231
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 232
    .line 233
    .line 234
    move-result v3

    .line 235
    iput v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->E:F

    .line 236
    .line 237
    iget v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 238
    .line 239
    iput v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->G:F

    .line 240
    .line 241
    iget-object v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->i:Landroid/view/VelocityTracker;

    .line 242
    .line 243
    invoke-virtual {v3}, Landroid/view/VelocityTracker;->clear()V

    .line 244
    .line 245
    .line 246
    sget-object v3, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->PEEKED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 247
    .line 248
    invoke-direct {p0, v3}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setState(Lcom/flipboard/bottomsheet/BottomSheetLayout$State;)V

    .line 249
    .line 250
    .line 251
    invoke-direct {p0, v11}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setSheetLayerTypeIfEnabled(I)V

    .line 252
    .line 253
    .line 254
    iget v4, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 255
    .line 256
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    invoke-virtual {v3, v6}, Landroid/view/MotionEvent;->setAction(I)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 264
    .line 265
    .line 266
    move-result-object v5

    .line 267
    invoke-virtual {v5, v3}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 268
    .line 269
    .line 270
    invoke-virtual {v3}, Landroid/view/MotionEvent;->recycle()V

    .line 271
    .line 272
    .line 273
    :cond_9
    iget-object v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 274
    .line 275
    sget-object v5, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->PEEKED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 276
    .line 277
    if-ne v3, v5, :cond_a

    .line 278
    .line 279
    cmpl-float v3, v4, v0

    .line 280
    .line 281
    if-lez v3, :cond_a

    .line 282
    .line 283
    invoke-direct {p0, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setSheetTranslation(F)V

    .line 284
    .line 285
    .line 286
    invoke-static {v0, v4}, Ljava/lang/Math;->min(FF)F

    .line 287
    .line 288
    .line 289
    move-result v4

    .line 290
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->setAction(I)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    invoke-virtual {v3, v0}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 302
    .line 303
    .line 304
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 305
    .line 306
    .line 307
    invoke-direct {p0, v10}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setState(Lcom/flipboard/bottomsheet/BottomSheetLayout$State;)V

    .line 308
    .line 309
    .line 310
    invoke-direct {p0, v1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setSheetLayerTypeIfEnabled(I)V

    .line 311
    .line 312
    .line 313
    :cond_a
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 314
    .line 315
    if-ne v0, v10, :cond_b

    .line 316
    .line 317
    iget v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 318
    .line 319
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 320
    .line 321
    .line 322
    move-result v1

    .line 323
    int-to-float v1, v1

    .line 324
    sub-float/2addr v0, v1

    .line 325
    invoke-virtual {p1, v7, v0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 326
    .line 327
    .line 328
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    invoke-virtual {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 333
    .line 334
    .line 335
    goto/16 :goto_4

    .line 336
    .line 337
    :cond_b
    cmpg-float v0, v4, v2

    .line 338
    .line 339
    if-gez v0, :cond_c

    .line 340
    .line 341
    sub-float v0, v2, v4

    .line 342
    .line 343
    const/high16 v1, 0x40800000    # 4.0f

    .line 344
    .line 345
    div-float/2addr v0, v1

    .line 346
    sub-float v4, v2, v0

    .line 347
    .line 348
    :cond_c
    invoke-direct {p0, v4}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setSheetTranslation(F)V

    .line 349
    .line 350
    .line 351
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 352
    .line 353
    .line 354
    move-result v0

    .line 355
    if-ne v0, v6, :cond_e

    .line 356
    .line 357
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->H:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 358
    .line 359
    if-ne v0, v10, :cond_d

    .line 360
    .line 361
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->s()V

    .line 362
    .line 363
    .line 364
    goto :goto_3

    .line 365
    :cond_d
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->B()V

    .line 366
    .line 367
    .line 368
    :cond_e
    :goto_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 369
    .line 370
    .line 371
    move-result p1

    .line 372
    if-ne p1, v8, :cond_18

    .line 373
    .line 374
    cmpg-float p1, v4, v2

    .line 375
    .line 376
    if-gez p1, :cond_f

    .line 377
    .line 378
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->q()V

    .line 379
    .line 380
    .line 381
    goto/16 :goto_4

    .line 382
    .line 383
    :cond_f
    iget-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->i:Landroid/view/VelocityTracker;

    .line 384
    .line 385
    const/16 v0, 0x3e8

    .line 386
    .line 387
    invoke-virtual {p1, v0}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 388
    .line 389
    .line 390
    iget-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->i:Landroid/view/VelocityTracker;

    .line 391
    .line 392
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 393
    .line 394
    .line 395
    move-result p1

    .line 396
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 397
    .line 398
    .line 399
    move-result v0

    .line 400
    iget v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->j:F

    .line 401
    .line 402
    cmpg-float v0, v0, v1

    .line 403
    .line 404
    if-gez v0, :cond_11

    .line 405
    .line 406
    iget p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 407
    .line 408
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 409
    .line 410
    .line 411
    move-result v0

    .line 412
    div-int/2addr v0, v11

    .line 413
    int-to-float v0, v0

    .line 414
    cmpl-float p1, p1, v0

    .line 415
    .line 416
    if-lez p1, :cond_10

    .line 417
    .line 418
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->s()V

    .line 419
    .line 420
    .line 421
    goto :goto_4

    .line 422
    :cond_10
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->B()V

    .line 423
    .line 424
    .line 425
    goto :goto_4

    .line 426
    :cond_11
    cmpg-float p1, p1, v7

    .line 427
    .line 428
    if-gez p1, :cond_12

    .line 429
    .line 430
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->s()V

    .line 431
    .line 432
    .line 433
    goto :goto_4

    .line 434
    :cond_12
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->B()V

    .line 435
    .line 436
    .line 437
    goto :goto_4

    .line 438
    :cond_13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 439
    .line 440
    .line 441
    move-result v0

    .line 442
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 443
    .line 444
    .line 445
    move-result v2

    .line 446
    int-to-float v2, v2

    .line 447
    iget v3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 448
    .line 449
    sub-float/2addr v2, v3

    .line 450
    cmpg-float v0, v0, v2

    .line 451
    .line 452
    if-ltz v0, :cond_14

    .line 453
    .line 454
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 455
    .line 456
    .line 457
    move-result v0

    .line 458
    invoke-direct {p0, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->A(F)Z

    .line 459
    .line 460
    .line 461
    move-result v0

    .line 462
    if-nez v0, :cond_15

    .line 463
    .line 464
    :cond_14
    move v1, v8

    .line 465
    :cond_15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 466
    .line 467
    .line 468
    move-result v0

    .line 469
    if-ne v0, v8, :cond_16

    .line 470
    .line 471
    if-eqz v1, :cond_16

    .line 472
    .line 473
    iget-boolean v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->u:Z

    .line 474
    .line 475
    if-eqz v0, :cond_16

    .line 476
    .line 477
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->q()V

    .line 478
    .line 479
    .line 480
    return v8

    .line 481
    :cond_16
    iget-boolean v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->A:Z

    .line 482
    .line 483
    if-eqz v0, :cond_17

    .line 484
    .line 485
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 486
    .line 487
    .line 488
    move-result v0

    .line 489
    iget v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->C:I

    .line 490
    .line 491
    int-to-float v1, v1

    .line 492
    sub-float v7, v0, v1

    .line 493
    .line 494
    :cond_17
    iget v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h:F

    .line 495
    .line 496
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 497
    .line 498
    .line 499
    move-result v1

    .line 500
    int-to-float v1, v1

    .line 501
    sub-float/2addr v0, v1

    .line 502
    invoke-virtual {p1, v7, v0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 503
    .line 504
    .line 505
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 506
    .line 507
    .line 508
    move-result-object p0

    .line 509
    invoke-virtual {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 510
    .line 511
    .line 512
    :cond_18
    :goto_4
    return v8
.end method

.method public q()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->r(Ljava/lang/Runnable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public s()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->o()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setSheetLayerTypeIfEnabled(I)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Lcom/flipboard/bottomsheet/BottomSheetLayout;->I:Landroid/util/Property;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getMaxSheetTranslation()F

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x1

    .line 15
    new-array v3, v3, [F

    .line 16
    .line 17
    aput v2, v3, v0

    .line 18
    .line 19
    invoke-static {p0, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-wide/16 v1, 0x12c

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->e:Landroid/animation/TimeInterpolator;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Lcom/flipboard/bottomsheet/BottomSheetLayout$b;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout$b;-><init>(Lcom/flipboard/bottomsheet/BottomSheetLayout;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->p:Landroid/animation/Animator;

    .line 45
    .line 46
    sget-object v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->EXPANDED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 47
    .line 48
    invoke-direct {p0, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setState(Lcom/flipboard/bottomsheet/BottomSheetLayout$State;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, -0x1

    .line 6
    invoke-super {p0, p1, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->t:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-super {p0, p1, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setDefaultViewTransformer(Ll/nml0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->l:Ll/nml0;

    .line 2
    .line 3
    return-void
.end method

.method public setInterceptContentTouch(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPeekOnDismiss(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPeekSheetTranslation(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->y:F

    .line 2
    .line 3
    return-void
.end method

.method public setShouldDimContentView(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->n:Z

    .line 2
    .line 3
    return-void
.end method

.method public setUseHardwareLayerWhileAnimating(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public z()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 2
    .line 3
    sget-object v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->HIDDEN:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
