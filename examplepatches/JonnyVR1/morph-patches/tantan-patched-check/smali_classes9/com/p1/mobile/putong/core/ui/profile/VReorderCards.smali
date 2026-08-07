.class public Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;
.super Landroid/view/ViewGroup;
.source "SourceFile"

# interfaces
.implements Lv/VScroll$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$c;,
        Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;",
        ">",
        "Landroid/view/ViewGroup;",
        "Lv/VScroll$b;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$c;

.field public B:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final a:Ljava/lang/String;

.field public b:Ll/jzk0;

.field public final c:F

.field public d:I

.field public e:Z

.field public f:Z

.field public g:Z

.field public h:Ll/t4m;

.field public i:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;

.field public j:Ljava/lang/Runnable;

.field public final k:I

.field public l:Z

.field public m:Z

.field public n:Landroid/view/GestureDetector$SimpleOnGestureListener;

.field public o:Ll/mmj;

.field public p:[Ll/jzk0;

.field public q:I

.field public r:I

.field public s:I

.field public t:Z

.field public u:Z

.field public v:Landroid/graphics/PointF;

.field public w:J

.field public final x:Ljava/lang/Runnable;

.field public y:Ljava/lang/String;

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "VReorderCards"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 10
    .line 11
    const/high16 v1, 0x3f400000    # 0.75f

    .line 12
    .line 13
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->c:F

    .line 14
    .line 15
    const/4 v1, 0x6

    .line 16
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->e:Z

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->f:Z

    .line 23
    .line 24
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->g:Z

    .line 25
    .line 26
    const/4 v3, 0x3

    .line 27
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->k:I

    .line 28
    .line 29
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->l:Z

    .line 30
    .line 31
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->m:Z

    .line 32
    .line 33
    new-instance v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;

    .line 34
    .line 35
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;)V

    .line 36
    .line 37
    .line 38
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->n:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 39
    .line 40
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->q:I

    .line 41
    .line 42
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->u:Z

    .line 43
    .line 44
    const-wide/16 v2, 0x0

    .line 45
    .line 46
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->w:J

    .line 47
    .line 48
    new-instance v2, Ll/gzk0;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/gzk0;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->x:Ljava/lang/Runnable;

    .line 54
    .line 55
    const-string v2, ""

    .line 56
    .line 57
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->y:Ljava/lang/String;

    .line 58
    .line 59
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->z:Z

    .line 60
    .line 61
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->l(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 65
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 66
    const-string v0, "VReorderCards"

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->a:Ljava/lang/String;

    const/4 v0, 0x0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    const/high16 v0, 0x3f400000    # 0.75f

    .line 68
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->c:F

    const/4 v0, 0x6

    .line 69
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    const/4 v0, 0x0

    .line 70
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->e:Z

    const/4 v1, 0x1

    .line 71
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->f:Z

    .line 72
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->g:Z

    const/4 v2, 0x3

    .line 73
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->k:I

    .line 74
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->l:Z

    .line 75
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->m:Z

    .line 76
    new-instance v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;

    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;)V

    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->n:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 77
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->q:I

    .line 78
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->u:Z

    const-wide/16 v1, 0x0

    .line 79
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->w:J

    .line 80
    new-instance v1, Ll/gzk0;

    invoke-direct {v1}, Ll/gzk0;-><init>()V

    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->x:Ljava/lang/Runnable;

    .line 81
    const-string v1, ""

    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->y:Ljava/lang/String;

    .line 82
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->z:Z

    .line 83
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->l(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 84
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 85
    const-string p3, "VReorderCards"

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->a:Ljava/lang/String;

    const/4 p3, 0x0

    .line 86
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    const/high16 p3, 0x3f400000    # 0.75f

    .line 87
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->c:F

    const/4 p3, 0x6

    .line 88
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    const/4 p3, 0x0

    .line 89
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->e:Z

    const/4 v0, 0x1

    .line 90
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->f:Z

    .line 91
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->g:Z

    const/4 v1, 0x3

    .line 92
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->k:I

    .line 93
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->l:Z

    .line 94
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->m:Z

    .line 95
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;

    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;)V

    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->n:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 96
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->q:I

    .line 97
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->u:Z

    const-wide/16 v0, 0x0

    .line 98
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->w:J

    .line 99
    new-instance v0, Ll/gzk0;

    invoke-direct {v0}, Ll/gzk0;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->x:Ljava/lang/Runnable;

    .line 100
    const-string v0, ""

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->y:Ljava/lang/String;

    .line 101
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->z:Z

    .line 102
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->l(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->o()V

    return-void
.end method

.method public static synthetic c(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setPressed(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic d()V
    .locals 1

    .line 1
    const-string v0, "\u5934\u50cf\u4f4d\u7f6e\u4e0d\u652f\u6301\u66f4\u6539"

    .line 2
    .line 3
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->x:Ljava/lang/Runnable;

    return-object p0
.end method


# virtual methods
.method public a(II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->k(II)Ll/jzk0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b:Z

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final f(Landroid/view/MotionEvent;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->w:J

    .line 6
    .line 7
    new-instance v0, Landroid/graphics/PointF;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->v:Landroid/graphics/PointF;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->u:Z

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    float-to-int v1, v1

    .line 30
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    float-to-int p1, p1

    .line 35
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->k(II)Ll/jzk0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_6

    .line 40
    .line 41
    iget p1, p1, Ll/jzk0;->e:I

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    if-ltz p1, :cond_5

    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 47
    .line 48
    aget-object v2, v2, p1

    .line 49
    .line 50
    iget-object v3, v2, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 51
    .line 52
    iget-boolean v4, v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b:Z

    .line 53
    .line 54
    if-nez v4, :cond_5

    .line 55
    .line 56
    iget-boolean v4, v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n:Z

    .line 57
    .line 58
    if-nez v4, :cond_0

    .line 59
    .line 60
    iget-boolean p1, v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->p:Z

    .line 61
    .line 62
    if-eqz p1, :cond_6

    .line 63
    .line 64
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->w:J

    .line 65
    .line 66
    const-wide/16 v2, 0x0

    .line 67
    .line 68
    cmp-long p1, v0, v2

    .line 69
    .line 70
    if-lez p1, :cond_6

    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->x:Ljava/lang/Runnable;

    .line 73
    .line 74
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    new-instance v0, Ll/fzk0;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/fzk0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    int-to-long v1, p0

    .line 91
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_0
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 96
    .line 97
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->z:Z

    .line 98
    .line 99
    move v1, v0

    .line 100
    :goto_0
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 101
    .line 102
    if-ge v1, v2, :cond_2

    .line 103
    .line 104
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 105
    .line 106
    aget-object v2, v2, v1

    .line 107
    .line 108
    iget-object v2, v2, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 109
    .line 110
    iget-boolean v3, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b:Z

    .line 111
    .line 112
    if-eqz v3, :cond_1

    .line 113
    .line 114
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 115
    .line 116
    .line 117
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_2
    move v1, v0

    .line 121
    :goto_1
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 122
    .line 123
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 124
    .line 125
    if-ge v1, v2, :cond_4

    .line 126
    .line 127
    aget-object v2, v3, v1

    .line 128
    .line 129
    iget-object v2, v2, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 130
    .line 131
    iget-boolean v3, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b:Z

    .line 132
    .line 133
    if-nez v3, :cond_3

    .line 134
    .line 135
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 136
    .line 137
    .line 138
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_4
    aget-object p1, v3, p1

    .line 142
    .line 143
    iget-object p1, p1, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 149
    .line 150
    .line 151
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->z:Z

    .line 152
    .line 153
    return-void

    .line 154
    :cond_5
    if-ltz p1, :cond_6

    .line 155
    .line 156
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 157
    .line 158
    aget-object p1, v0, p1

    .line 159
    .line 160
    iget-object p1, p1, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 161
    .line 162
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b:Z

    .line 163
    .line 164
    if-eqz p1, :cond_6

    .line 165
    .line 166
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->u:Z

    .line 167
    .line 168
    :cond_6
    return-void
.end method

.method public final g(Landroid/view/MotionEvent;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->v:Landroid/graphics/PointF;

    .line 10
    .line 11
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 12
    .line 13
    sub-float v1, v0, v1

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    float-to-double v1, v1

    .line 20
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    .line 21
    .line 22
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->v:Landroid/graphics/PointF;

    .line 27
    .line 28
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 29
    .line 30
    sub-float v5, p1, v5

    .line 31
    .line 32
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    float-to-double v5, v5

    .line 37
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->pow(DD)D

    .line 38
    .line 39
    .line 40
    move-result-wide v3

    .line 41
    add-double/2addr v1, v3

    .line 42
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 43
    .line 44
    .line 45
    move-result-wide v1

    .line 46
    double-to-int v1, v1

    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-ge v1, v2, :cond_0

    .line 60
    .line 61
    float-to-int v0, v0

    .line 62
    float-to-int p1, p1

    .line 63
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->k(II)Ll/jzk0;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    if-eqz p1, :cond_0

    .line 68
    .line 69
    iget-object v0, p1, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    invoke-virtual {v0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 73
    .line 74
    .line 75
    new-instance v1, Ll/hzk0;

    .line 76
    .line 77
    invoke-direct {v1, v0}, Ll/hzk0;-><init>(Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    const-wide/16 v2, 0x32

    .line 81
    .line 82
    invoke-virtual {p0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->m()Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-nez p0, :cond_0

    .line 90
    .line 91
    iget-object p0, p1, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->u()V

    .line 94
    .line 95
    .line 96
    :cond_0
    return-void
.end method

.method public h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v1, v0, v1

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    aget-object p0, v0, p1

    .line 16
    .line 17
    iget-object p0, p0, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 18
    .line 19
    return-object p0
.end method

.method public i()I
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    aget-object v3, p0, v1

    .line 9
    .line 10
    iget-object v3, v3, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    iget-boolean v3, v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b:Z

    .line 15
    .line 16
    if-nez v3, :cond_0

    .line 17
    .line 18
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    return v2
.end method

.method public j(I)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int v1, p1, v1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    sub-int/2addr v1, v2

    .line 16
    div-int/lit8 v1, v1, 0x3

    .line 17
    .line 18
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->q:I

    .line 19
    .line 20
    sub-int v3, v1, v2

    .line 21
    .line 22
    int-to-float v3, v3

    .line 23
    const/high16 v4, 0x3f400000    # 0.75f

    .line 24
    .line 25
    div-float/2addr v3, v4

    .line 26
    float-to-int v3, v3

    .line 27
    add-int/2addr v3, v2

    .line 28
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 29
    .line 30
    div-int/lit8 v2, v2, 0x3

    .line 31
    .line 32
    const/4 v4, 0x1

    .line 33
    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    mul-int/2addr v2, v3

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    add-int/2addr v2, v5

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    add-int/2addr v2, v5

    .line 48
    invoke-virtual {p0, p1, v2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 49
    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    move v2, p1

    .line 53
    :goto_0
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 54
    .line 55
    if-ge v2, v5, :cond_0

    .line 56
    .line 57
    div-int/lit8 v5, v2, 0x3

    .line 58
    .line 59
    rem-int/lit8 v6, v2, 0x3

    .line 60
    .line 61
    mul-int v7, v1, v6

    .line 62
    .line 63
    add-int/2addr v7, v0

    .line 64
    mul-int v8, v5, v3

    .line 65
    .line 66
    add-int/2addr v6, v4

    .line 67
    mul-int/2addr v6, v1

    .line 68
    add-int/2addr v6, v0

    .line 69
    add-int/2addr v5, v4

    .line 70
    mul-int/2addr v5, v3

    .line 71
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 72
    .line 73
    aget-object v9, v9, v2

    .line 74
    .line 75
    invoke-virtual {v9, v7, v8, v6, v5}, Ll/jzk0;->g(IIII)V

    .line 76
    .line 77
    .line 78
    add-int/lit8 v2, v2, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    const/high16 v0, 0x40000000    # 2.0f

    .line 82
    .line 83
    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-static {v3, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->r:I

    .line 92
    .line 93
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->s:I

    .line 94
    .line 95
    :goto_1
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 96
    .line 97
    if-ge p1, v1, :cond_2

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 100
    .line 101
    aget-object v1, v1, p1

    .line 102
    .line 103
    iget-object v3, v1, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 104
    .line 105
    if-nez v3, :cond_1

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 112
    .line 113
    invoke-virtual {v1, v3}, Ll/jzk0;->f(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)V

    .line 114
    .line 115
    .line 116
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 117
    .line 118
    aget-object v1, v1, p1

    .line 119
    .line 120
    iget-object v1, v1, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 121
    .line 122
    invoke-virtual {v1, v2, v0}, Landroid/view/View;->measure(II)V

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 126
    .line 127
    aget-object v1, v1, p1

    .line 128
    .line 129
    iget-object v1, v1, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 130
    .line 131
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->y:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->setCurPageId(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    add-int/lit8 p1, p1, 0x1

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_2
    return-void
.end method

.method public k(II)Ll/jzk0;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 3
    .line 4
    if-ge v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 7
    .line 8
    aget-object v1, v1, v0

    .line 9
    .line 10
    invoke-virtual {v1, p1, p2}, Ll/jzk0;->d(II)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 17
    .line 18
    aget-object p0, p0, v0

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public l(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    sget-object v0, Ll/rhc0;->a:[I

    .line 4
    .line 5
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget v0, Ll/rhc0;->b:I

    .line 10
    .line 11
    const/4 v1, 0x6

    .line 12
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 17
    .line 18
    :cond_0
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 21
    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/mmj;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->n:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 33
    .line 34
    invoke-direct {v0, p1, v1}, Ll/mmj;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->o:Ll/mmj;

    .line 38
    .line 39
    invoke-virtual {v0, p2}, Ll/mmj;->b(Z)V

    .line 40
    .line 41
    .line 42
    sget p1, Ll/qa00;->e:I

    .line 43
    .line 44
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->q:I

    .line 45
    .line 46
    return-void
.end method

.method public m()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 4
    .line 5
    if-ge v1, v2, :cond_1

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 8
    .line 9
    aget-object v2, v2, v1

    .line 10
    .line 11
    iget-object v2, v2, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 14
    .line 15
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 22
    .line 23
    aget-object v2, v2, v1

    .line 24
    .line 25
    iget-object v2, v2, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/w30;->d()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return v0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic o()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->w:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->x:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    move p2, p1

    .line 3
    :goto_0
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 4
    .line 5
    if-ge p2, p3, :cond_1

    .line 6
    .line 7
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 8
    .line 9
    aget-object p3, p3, p2

    .line 10
    .line 11
    iget-object p3, p3, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 12
    .line 13
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m()Z

    .line 14
    .line 15
    .line 16
    move-result p4

    .line 17
    if-nez p4, :cond_0

    .line 18
    .line 19
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    .line 20
    .line 21
    .line 22
    move-result p4

    .line 23
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    .line 24
    .line 25
    .line 26
    move-result p5

    .line 27
    invoke-virtual {p3, p1, p1, p4, p5}, Landroid/view/View;->layout(IIII)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->y()V

    .line 31
    .line 32
    .line 33
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-void
.end method

.method public onMeasure(II)V
    .locals 10

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->t:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->j(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 14
    .line 15
    .line 16
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->q:I

    .line 17
    .line 18
    mul-int/lit8 v0, p1, 0x4

    .line 19
    .line 20
    sub-int/2addr p2, v0

    .line 21
    const/4 v0, 0x2

    .line 22
    add-int/2addr p2, v0

    .line 23
    const/4 v1, 0x3

    .line 24
    div-int/2addr p2, v1

    .line 25
    mul-int/lit8 v2, p1, 0x2

    .line 26
    .line 27
    add-int/2addr v2, p2

    .line 28
    mul-int/lit8 v3, p2, 0x2

    .line 29
    .line 30
    mul-int/lit8 v4, p1, 0x3

    .line 31
    .line 32
    add-int/2addr v4, v3

    .line 33
    filled-new-array {p1, v2, v4}, [I

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    add-int v4, p2, p1

    .line 38
    .line 39
    mul-int/lit8 v5, p1, 0x2

    .line 40
    .line 41
    add-int/2addr v3, v5

    .line 42
    mul-int/lit8 v5, p2, 0x3

    .line 43
    .line 44
    mul-int/2addr p1, v1

    .line 45
    add-int/2addr v5, p1

    .line 46
    filled-new-array {v4, v3, v5}, [I

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->r:I

    .line 51
    .line 52
    if-eq v3, p2, :cond_1

    .line 53
    .line 54
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    aget-object v3, v3, v4

    .line 58
    .line 59
    aget v5, v2, v4

    .line 60
    .line 61
    const/4 v6, 0x1

    .line 62
    aget v7, p1, v6

    .line 63
    .line 64
    invoke-virtual {v3, v5, v5, v7, v7}, Ll/jzk0;->g(IIII)V

    .line 65
    .line 66
    .line 67
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 68
    .line 69
    aget-object v3, v3, v6

    .line 70
    .line 71
    aget v5, v2, v0

    .line 72
    .line 73
    aget v7, v2, v4

    .line 74
    .line 75
    aget v8, p1, v0

    .line 76
    .line 77
    aget v9, p1, v4

    .line 78
    .line 79
    invoke-virtual {v3, v5, v7, v8, v9}, Ll/jzk0;->g(IIII)V

    .line 80
    .line 81
    .line 82
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 83
    .line 84
    aget-object v3, v3, v0

    .line 85
    .line 86
    aget v5, v2, v0

    .line 87
    .line 88
    aget v7, v2, v6

    .line 89
    .line 90
    aget v8, p1, v0

    .line 91
    .line 92
    aget v9, p1, v6

    .line 93
    .line 94
    invoke-virtual {v3, v5, v7, v8, v9}, Ll/jzk0;->g(IIII)V

    .line 95
    .line 96
    .line 97
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 98
    .line 99
    aget-object v1, v3, v1

    .line 100
    .line 101
    aget v3, v2, v0

    .line 102
    .line 103
    aget v5, p1, v0

    .line 104
    .line 105
    invoke-virtual {v1, v3, v3, v5, v5}, Ll/jzk0;->g(IIII)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 109
    .line 110
    const/4 v3, 0x4

    .line 111
    aget-object v1, v1, v3

    .line 112
    .line 113
    aget v3, v2, v6

    .line 114
    .line 115
    aget v5, v2, v0

    .line 116
    .line 117
    aget v7, p1, v6

    .line 118
    .line 119
    aget v8, p1, v0

    .line 120
    .line 121
    invoke-virtual {v1, v3, v5, v7, v8}, Ll/jzk0;->g(IIII)V

    .line 122
    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 125
    .line 126
    const/4 v3, 0x5

    .line 127
    aget-object v1, v1, v3

    .line 128
    .line 129
    aget v3, v2, v4

    .line 130
    .line 131
    aget v2, v2, v0

    .line 132
    .line 133
    aget v5, p1, v4

    .line 134
    .line 135
    aget v0, p1, v0

    .line 136
    .line 137
    invoke-virtual {v1, v3, v2, v5, v0}, Ll/jzk0;->g(IIII)V

    .line 138
    .line 139
    .line 140
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->r:I

    .line 141
    .line 142
    aget p1, p1, v6

    .line 143
    .line 144
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->s:I

    .line 145
    .line 146
    const/high16 p2, 0x40000000    # 2.0f

    .line 147
    .line 148
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    :goto_0
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 153
    .line 154
    if-ge v4, p2, :cond_1

    .line 155
    .line 156
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 157
    .line 158
    aget-object p2, p2, v4

    .line 159
    .line 160
    iget-object p2, p2, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 161
    .line 162
    invoke-virtual {p2, p1, p1}, Landroid/view/View;->measure(II)V

    .line 163
    .line 164
    .line 165
    add-int/lit8 v4, v4, 0x1

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_1
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->g:Z

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v0, :cond_8

    .line 16
    .line 17
    const-wide/16 v3, 0x0

    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    if-eq v0, v1, :cond_3

    .line 21
    .line 22
    const/4 v2, 0x3

    .line 23
    if-eq v0, v2, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, v0, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->x()V

    .line 33
    .line 34
    .line 35
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 36
    .line 37
    :cond_2
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->w:J

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 41
    .line 42
    if-eqz v0, :cond_5

    .line 43
    .line 44
    iget-object v0, v0, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 45
    .line 46
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->a:Z

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h:Ll/t4m;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    invoke-interface {v0}, Ll/t4m;->d()V

    .line 55
    .line 56
    .line 57
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 58
    .line 59
    iget-object v0, v0, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->x()V

    .line 62
    .line 63
    .line 64
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 65
    .line 66
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->f:Z

    .line 67
    .line 68
    if-nez v0, :cond_6

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->g(Landroid/view/MotionEvent;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->u:Z

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->g(Landroid/view/MotionEvent;)V

    .line 79
    .line 80
    .line 81
    :cond_6
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->l:Z

    .line 82
    .line 83
    if-nez v0, :cond_7

    .line 84
    .line 85
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->m:Z

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 92
    .line 93
    .line 94
    :cond_7
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->w:J

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->f(Landroid/view/MotionEvent;)V

    .line 98
    .line 99
    .line 100
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->l:Z

    .line 101
    .line 102
    if-nez v0, :cond_9

    .line 103
    .line 104
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->m:Z

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 111
    .line 112
    .line 113
    :cond_9
    :goto_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->u:Z

    .line 114
    .line 115
    if-nez v0, :cond_a

    .line 116
    .line 117
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->f:Z

    .line 118
    .line 119
    if-eqz v0, :cond_a

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->o:Ll/mmj;

    .line 122
    .line 123
    invoke-virtual {p0, p1}, Ll/mmj;->a(Landroid/view/MotionEvent;)Z

    .line 124
    .line 125
    .line 126
    :cond_a
    return v1
.end method

.method public p()Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public q(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->j:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public requestLayout()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->z:Z

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

.method public setCardPadding(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->q:I

    .line 2
    .line 3
    return-void
.end method

.method public setCardsCrop(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->t:Z

    .line 2
    .line 3
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCurPageId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->y:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDragging(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->B:Ll/y20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->B:Ll/y20;

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setEnableDrag(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOnDraggingListener(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->B:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setReorderCardsCallback(Ll/t4m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h:Ll/t4m;

    .line 2
    .line 3
    return-void
.end method

.method public setSlideWithoutPress(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public setUploadListener(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;

    .line 2
    .line 3
    return-void
.end method

.method public setViewCatchListener(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->A:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$c;

    .line 2
    .line 3
    return-void
.end method

.method public setViewCount(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 5
    .line 6
    new-array v0, p1, [Ll/jzk0;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :goto_0
    if-ge v0, p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p()Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 18
    .line 19
    new-instance v3, Ll/jzk0;

    .line 20
    .line 21
    invoke-direct {v3, p0, v0}, Ll/jzk0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;I)V

    .line 22
    .line 23
    .line 24
    aput-object v3, v2, v0

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 27
    .line 28
    aget-object v2, v2, v0

    .line 29
    .line 30
    invoke-virtual {v2, v1}, Ll/jzk0;->f(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->requestLayout()V

    .line 40
    .line 41
    .line 42
    return-void
.end method
