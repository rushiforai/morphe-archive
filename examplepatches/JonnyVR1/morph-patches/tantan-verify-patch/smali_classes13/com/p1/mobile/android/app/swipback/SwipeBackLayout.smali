.class public Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;
    }
.end annotation


# static fields
.field public static final C:I

.field public static D:Z

.field public static E:Ljava/lang/reflect/Field;

.field public static F:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;",
            ">;>;>;"
        }
    .end annotation
.end field


# instance fields
.field public A:Landroid/graphics/Paint;

.field public B:Z

.field public a:F

.field public b:Z

.field public c:Landroid/view/View;

.field public d:Ll/ykl0;

.field public e:F

.field public f:I

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ujh0;",
            ">;"
        }
    .end annotation
.end field

.field public h:Landroid/graphics/drawable/Drawable;

.field public i:F

.field public j:I

.field public k:Z

.field public l:Z

.field public m:Landroid/graphics/Rect;

.field public n:I

.field public o:I

.field public p:Z

.field public q:Z

.field public r:F

.field public s:F

.field public t:I

.field public u:I

.field public v:[I

.field public w:Landroid/graphics/Point;

.field public x:J

.field public y:Landroid/graphics/Paint;

.field public z:Landroid/graphics/Shader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41200000    # 10.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->C:I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    sput-boolean v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->D:Z

    .line 11
    .line 12
    new-instance v0, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->F:Ljava/util/HashMap;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 147
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 146
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x3e99999a    # 0.3f

    .line 5
    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->a:F

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->b:Z

    .line 11
    .line 12
    const/high16 p2, -0x67000000

    .line 13
    .line 14
    iput p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->j:I

    .line 15
    .line 16
    new-instance p2, Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->m:Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-static {}, Ll/bnl0;->y0()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    div-int/lit8 p2, p2, 0xa

    .line 28
    .line 29
    iput p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->o:I

    .line 30
    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->p:Z

    .line 32
    .line 33
    const/4 p2, 0x0

    .line 34
    iput-boolean p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->q:Z

    .line 35
    .line 36
    invoke-static {}, Ll/bnl0;->F0()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    iput p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->t:I

    .line 41
    .line 42
    const/4 p2, 0x2

    .line 43
    new-array p2, p2, [I

    .line 44
    .line 45
    iput-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->v:[I

    .line 46
    .line 47
    new-instance p2, Landroid/graphics/Point;

    .line 48
    .line 49
    invoke-direct {p2}, Landroid/graphics/Point;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->w:Landroid/graphics/Point;

    .line 53
    .line 54
    const-wide/16 p2, 0x0

    .line 55
    .line 56
    iput-wide p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->x:J

    .line 57
    .line 58
    new-instance p2, Landroid/graphics/Paint;

    .line 59
    .line 60
    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->y:Landroid/graphics/Paint;

    .line 64
    .line 65
    new-instance p2, Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->A:Landroid/graphics/Paint;

    .line 71
    .line 72
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->y:Landroid/graphics/Paint;

    .line 73
    .line 74
    const/high16 p3, -0x1000000

    .line 75
    .line 76
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->y:Landroid/graphics/Paint;

    .line 80
    .line 81
    const/16 p3, 0xff

    .line 82
    .line 83
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 84
    .line 85
    .line 86
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->A:Landroid/graphics/Paint;

    .line 87
    .line 88
    const/4 p3, -0x1

    .line 89
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 90
    .line 91
    .line 92
    new-instance p2, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;

    .line 93
    .line 94
    const/4 p3, 0x0

    .line 95
    invoke-direct {p2, p0, p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;-><init>(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;Ll/tfh0;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p0, p2}, Ll/ykl0;->p(Landroid/view/ViewGroup;Ll/ykl0$c;)Ll/ykl0;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    iput-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->d:Ll/ykl0;

    .line 103
    .line 104
    sget p2, Ll/abc0;->p6:I

    .line 105
    .line 106
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->setShadow(I)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    .line 118
    .line 119
    const/high16 p3, 0x43c80000    # 400.0f

    .line 120
    .line 121
    mul-float/2addr p2, p3

    .line 122
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 123
    .line 124
    .line 125
    move-result-object p3

    .line 126
    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 127
    .line 128
    .line 129
    move-result-object p3

    .line 130
    iget p3, p3, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 131
    .line 132
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->y(I)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 133
    .line 134
    .line 135
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->d:Ll/ykl0;

    .line 136
    .line 137
    invoke-virtual {p3, p2}, Ll/ykl0;->N(F)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->d:Ll/ykl0;

    .line 141
    .line 142
    invoke-virtual {p0, p1}, Ll/ykl0;->M(I)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->p:Z

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->q:Z

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->s:F

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->r:F

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->f:I

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->c:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ll/ykl0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->d:Ll/ykl0;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->g:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->e:F

    return p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->a:F

    return p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->n:I

    return p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->f:I

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->e:F

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->F()Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->G()Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->H(I)V

    return-void
.end method

.method public static w(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    const/4 v2, -0x1

    .line 9
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->F:Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/util/ArrayList;

    .line 35
    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    new-instance v1, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    sget-object v2, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->F:Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v2, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    :cond_0
    new-instance p0, Ljava/lang/ref/WeakReference;

    .line 57
    .line 58
    invoke-direct {p0, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    return-object v0
.end method


# virtual methods
.method public A(I)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x22

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->A:Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public B(I)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->y:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->y:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Paint;->getColor()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Z)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x22

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->B:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final E()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/app/Activity;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/app/Activity;->isInMultiWindowMode()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/bnl0;->T(Landroid/content/Context;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->v:[I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/app/Activity;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->w:Landroid/graphics/Point;

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->v:[I

    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    aget v0, v0, v2

    .line 52
    .line 53
    iget-object v2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->w:Landroid/graphics/Point;

    .line 54
    .line 55
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 56
    .line 57
    div-int/lit8 v2, v2, 0x4

    .line 58
    .line 59
    if-le v0, v2, :cond_1

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->y:Landroid/graphics/Paint;

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    invoke-static {}, Ll/ive0;->l()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 74
    .line 75
    const/16 v2, 0x1b

    .line 76
    .line 77
    if-lt v0, v2, :cond_1

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->y:Landroid/graphics/Paint;

    .line 80
    .line 81
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 82
    .line 83
    .line 84
    :cond_1
    return-void
.end method

.method public final F()Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->F:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/app/Activity;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/util/ArrayList;

    .line 22
    .line 23
    :goto_0
    if-eqz p0, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x1

    .line 30
    if-le v0, v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    add-int/lit8 v0, v0, -0x2

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 43
    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    add-int/lit8 v0, v0, -0x2

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 61
    .line 62
    if-nez v0, :cond_1

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    add-int/lit8 v0, v0, -0x2

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    return-object v0

    .line 75
    :cond_2
    const/4 p0, 0x0

    .line 76
    return-object p0
.end method

.method public final G()Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->F:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/app/Activity;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/util/ArrayList;

    .line 22
    .line 23
    :goto_0
    if-eqz p0, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/lit8 v0, v0, -0x1

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/lit8 v0, v0, -0x1

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 60
    .line 61
    if-nez v0, :cond_1

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/lit8 v0, v0, -0x1

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    return-object v0

    .line 74
    :cond_2
    const/4 p0, 0x0

    .line 75
    return-object p0
.end method

.method public final H(I)V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/bnl0;->F0()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-static {}, Ll/bnl0;->y0()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 15
    .line 16
    int-to-float v3, p1

    .line 17
    int-to-float v4, v0

    .line 18
    add-int/2addr p1, v1

    .line 19
    int-to-float v5, p1

    .line 20
    const-string p1, "#c42d16"

    .line 21
    .line 22
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const-string v0, "#d46813"

    .line 27
    .line 28
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    filled-new-array {p1, v0}, [I

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    const/4 v8, 0x0

    .line 37
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 38
    .line 39
    const/4 v6, 0x0

    .line 40
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 41
    .line 42
    .line 43
    iput-object v2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->z:Landroid/graphics/Shader;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->y:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public computeScroll()V
    .locals 2

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->e:F

    .line 4
    .line 5
    sub-float/2addr v0, v1

    .line 6
    iput v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i:F

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->d:Ll/ykl0;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Ll/ykl0;->n(Z)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 13

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iget-wide v2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->x:J

    .line 15
    .line 16
    sub-long v2, v0, v2

    .line 17
    .line 18
    const-wide/16 v4, 0x64

    .line 19
    .line 20
    cmp-long v2, v2, v4

    .line 21
    .line 22
    if-lez v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->E()V

    .line 25
    .line 26
    .line 27
    iput-wide v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->x:J

    .line 28
    .line 29
    :cond_0
    iget v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->f:I

    .line 30
    .line 31
    int-to-float v2, v0

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    int-to-float v4, v0

    .line 37
    iget v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->t:I

    .line 38
    .line 39
    int-to-float v5, v0

    .line 40
    iget-object v6, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->y:Landroid/graphics/Paint;

    .line 41
    .line 42
    const/4 v3, 0x0

    .line 43
    move-object v1, p1

    .line 44
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 45
    .line 46
    .line 47
    iget-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->B:Z

    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->f:I

    .line 52
    .line 53
    int-to-float v8, p1

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iget v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->u:I

    .line 59
    .line 60
    sub-int/2addr p1, v0

    .line 61
    int-to-float v9, p1

    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    int-to-float v10, p1

    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    int-to-float v11, p1

    .line 72
    iget-object v12, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->A:Landroid/graphics/Paint;

    .line 73
    .line 74
    move-object v7, v1

    .line 75
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->s:F

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->r:F

    .line 23
    .line 24
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method public drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->c:Landroid/view/View;

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    iget p4, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i:F

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    cmpl-float p4, p4, v1

    .line 16
    .line 17
    if-lez p4, :cond_1

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object p4, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->d:Ll/ykl0;

    .line 22
    .line 23
    invoke-virtual {p4}, Ll/ykl0;->A()I

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    if-eqz p4, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->v(Landroid/graphics/Canvas;Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->u(Landroid/graphics/Canvas;Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return p3
.end method

.method public onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 4
    .line 5
    const/16 v1, 0x22

    .line 6
    .line 7
    if-le v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->t:I

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->u:I

    .line 20
    .line 21
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->d:Ll/ykl0;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ykl0;->P(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return p0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    new-instance p1, Ljava/lang/Exception;

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "SwipeBackLayout onInterceptTouchEvent:"

    .line 20
    .line 21
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-direct {p1, v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    return v1
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->k:Z

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->c:Landroid/view/View;

    .line 5
    .line 6
    const/4 p2, 0x0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->f:I

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    add-int/2addr p4, p3

    .line 16
    iget-object p5, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->c:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {p5}, Landroid/view/View;->getMeasuredHeight()I

    .line 19
    .line 20
    .line 21
    move-result p5

    .line 22
    invoke-virtual {p1, p3, p2, p4, p5}, Landroid/view/View;->layout(IIII)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iput-boolean p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->k:Z

    .line 26
    .line 27
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->d:Ll/ykl0;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ykl0;->G(Landroid/view/MotionEvent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    new-instance p1, Ljava/lang/Exception;

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "SwipeBackLayout onTouchEvent:"

    .line 20
    .line 21
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-direct {p1, v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    return v1
.end method

.method public q(Ll/ujh0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->g:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->g:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public r()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/app/Activity;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Landroid/view/ViewGroup;

    .line 52
    .line 53
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-nez v5, :cond_0

    .line 65
    .line 66
    iput-object v3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->c:Landroid/view/View;

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_0
    new-instance v5, Landroid/widget/FrameLayout;

    .line 70
    .line 71
    invoke-direct {v5, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    :goto_0
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-lez v0, :cond_1

    .line 82
    .line 83
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_1
    iput-object v5, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->c:Landroid/view/View;

    .line 95
    .line 96
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->c:Landroid/view/View;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->c:Landroid/view/View;

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 107
    .line 108
    .line 109
    sget-boolean v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->D:Z

    .line 110
    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    :try_start_0
    sget-object v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->E:Ljava/lang/reflect/Field;

    .line 114
    .line 115
    if-nez v0, :cond_2

    .line 116
    .line 117
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v0}, Lorg/joor/Reflect;->on(Ljava/lang/Class;)Lorg/joor/Reflect;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const-string v1, "mContentRoot"

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Lorg/joor/Reflect;->field0(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    sput-object v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->E:Ljava/lang/reflect/Field;

    .line 132
    .line 133
    :cond_2
    sget-object v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->E:Ljava/lang/reflect/Field;

    .line 134
    .line 135
    invoke-virtual {v0, v2, p0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :catchall_0
    sput-boolean v4, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->D:Z

    .line 140
    .line 141
    :cond_3
    return-void
.end method

.method public requestLayout()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    cmpl-float v0, v0, v1

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/view/View;->setX(F)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setEdgeSizePercent(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    mul-float/2addr v0, p1

    .line 13
    float-to-int p1, v0

    .line 14
    iput p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->n:I

    .line 15
    .line 16
    return-void
.end method

.method public setEnableConvertActivityFromTranslucent(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEnableGesture(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFullSlide(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->q:Z

    .line 2
    .line 3
    return-void
.end method

.method public setScrimColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->j:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setScrollThreshold(F)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    cmpg-float v0, p1, v0

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->a:F

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p0, "Threshold value should be between 0 and 1.0"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setShadow(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->setShadow(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setShadow(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h:Landroid/graphics/drawable/Drawable;

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setSwipeListener(Ll/ujh0;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->q(Ll/ujh0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->c:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/app/Activity;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    return-object v0
.end method

.method public final u(Landroid/graphics/Canvas;Landroid/view/View;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->j:I

    .line 2
    .line 3
    const/high16 v1, -0x1000000

    .line 4
    .line 5
    and-int/2addr v1, v0

    .line 6
    ushr-int/lit8 v1, v1, 0x18

    .line 7
    .line 8
    int-to-float v1, v1

    .line 9
    iget v2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i:F

    .line 10
    .line 11
    mul-float/2addr v1, v2

    .line 12
    float-to-int v1, v1

    .line 13
    shl-int/lit8 v1, v1, 0x18

    .line 14
    .line 15
    const v2, 0xffffff

    .line 16
    .line 17
    .line 18
    and-int/2addr v0, v2

    .line 19
    or-int/2addr v0, v1

    .line 20
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {p1, v1, v1, p2, p0}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final v(Landroid/graphics/Canvas;Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->m:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    sub-int/2addr v1, v2

    .line 15
    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 16
    .line 17
    iget v3, v0, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 20
    .line 21
    invoke-virtual {p2, v1, v2, v3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    iget v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i:F

    .line 27
    .line 28
    const/high16 v1, 0x437f0000    # 255.0f

    .line 29
    .line 30
    mul-float/2addr v0, v1

    .line 31
    float-to-int v0, v0

    .line 32
    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h:Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public x()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->F:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Landroid/app/Activity;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/app/Activity;->getTaskId()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/util/ArrayList;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    add-int/lit8 v1, v1, -0x1

    .line 30
    .line 31
    :goto_0
    if-ltz v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 44
    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    if-ne v2, p0, :cond_0

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    return-void
.end method

.method public y(I)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->n:I

    .line 2
    .line 3
    return-object p0
.end method

.method public z()Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->l:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->H(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
