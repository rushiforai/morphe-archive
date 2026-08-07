.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# static fields
.field public static final G:I


# instance fields
.field public A:Z

.field public B:Landroid/animation/Animator;

.field public C:Landroid/animation/AnimatorSet;

.field public D:Landroid/animation/AnimatorSet;

.field public E:Landroid/animation/AnimatorSet;

.field public F:I

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Lv/VImage;

.field public i:Lcom/p1/mobile/putong/live/livingroom/increment/noble/GiftDialogNobelEntranceView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/TextView;

.field public m:Ll/bjs;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bjs<",
            "*>;"
        }
    .end annotation
.end field

.field public n:Landroid/animation/AnimatorSet;

.field public o:Landroid/animation/AnimatorSet;

.field public p:Landroid/animation/AnimatorSet;

.field public q:Lv/VDraweeView;

.field public r:Lv/VDraweeView;

.field public s:Landroid/animation/Animator;

.field public final t:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;

.field public u:J

.field public v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

.field public w:D

.field public x:Z

.field public y:Z

.field public z:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x42100000    # 36.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->G:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->t:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->u:J

    .line 14
    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->w:D

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->x:Z

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->y:Z

    .line 24
    .line 25
    new-instance p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->z:Ljava/util/List;

    .line 31
    .line 32
    const/high16 p1, 0x42000000    # 32.0f

    .line 33
    .line 34
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->F:I

    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;

    invoke-direct {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->t:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;

    const-wide/16 p1, 0x0

    .line 43
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->u:J

    const-wide/16 p1, 0x0

    .line 44
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->w:D

    const/4 p1, 0x0

    .line 45
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->x:Z

    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->y:Z

    .line 47
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->z:Ljava/util/List;

    const/high16 p1, 0x42000000    # 32.0f

    .line 48
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->F:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 49
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 50
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;

    invoke-direct {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->t:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;

    const-wide/16 p1, 0x0

    .line 51
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->u:J

    const-wide/16 p1, 0x0

    .line 52
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->w:D

    const/4 p1, 0x0

    .line 53
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->x:Z

    const/4 p1, 0x1

    .line 54
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->y:Z

    .line 55
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->z:Ljava/util/List;

    const/high16 p1, 0x42000000    # 32.0f

    .line 56
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->F:I

    return-void
.end method

.method public static bridge synthetic B0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->F:I

    return-void
.end method

.method private G0()Landroid/animation/AnimatorSet;
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->G:I

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    filled-new-array {v1, v2}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-wide/16 v3, 0x12c

    .line 18
    .line 19
    invoke-virtual {v1, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    .line 22
    new-instance v3, Ll/b3k;

    .line 23
    .line 24
    invoke-direct {v3, p0}, Ll/b3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 28
    .line 29
    .line 30
    const/4 v3, 0x2

    .line 31
    new-array v4, v3, [F

    .line 32
    .line 33
    fill-array-data v4, :array_0

    .line 34
    .line 35
    .line 36
    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 37
    .line 38
    invoke-static {p0, v5, v4}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-wide/16 v4, 0x64

    .line 43
    .line 44
    invoke-virtual {p0, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    new-array v3, v3, [Landroid/animation/Animator;

    .line 48
    .line 49
    aput-object v1, v3, v2

    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    aput-object p0, v3, v1

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 55
    .line 56
    .line 57
    return-object v0

    .line 58
    nop

    .line 59
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private H0()Landroid/animation/AnimatorSet;
    .locals 7

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->G:I

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    filled-new-array {v2, v1}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-wide/16 v3, 0x12c

    .line 18
    .line 19
    invoke-virtual {v1, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    .line 22
    new-instance v3, Ll/d3k;

    .line 23
    .line 24
    invoke-direct {v3, p0}, Ll/d3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 28
    .line 29
    .line 30
    const/4 v3, 0x2

    .line 31
    new-array v4, v3, [F

    .line 32
    .line 33
    fill-array-data v4, :array_0

    .line 34
    .line 35
    .line 36
    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 37
    .line 38
    invoke-static {p0, v5, v4}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    const-wide/16 v5, 0x64

    .line 43
    .line 44
    invoke-virtual {v4, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    new-array v3, v3, [Landroid/animation/Animator;

    .line 48
    .line 49
    aput-object v1, v3, v2

    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    aput-object v4, v3, v1

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 55
    .line 56
    .line 57
    new-instance v1, Ll/e3k;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/e3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 63
    .line 64
    .line 65
    new-instance v1, Ll/f3k;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/f3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    return-object v0

    .line 74
    nop

    .line 75
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private synthetic X0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->wealthRatio:D

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->setProgress(D)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private getNoticeTextAnim()Landroid/animation/AnimatorSet;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->E:Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->l:Landroid/widget/TextView;

    .line 21
    .line 22
    const/high16 v4, 0x40c00000    # 6.0f

    .line 23
    .line 24
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    int-to-float v4, v4

    .line 29
    const/4 v5, 0x2

    .line 30
    new-array v6, v5, [F

    .line 31
    .line 32
    const/4 v7, 0x0

    .line 33
    aput v4, v6, v7

    .line 34
    .line 35
    const/4 v4, 0x1

    .line 36
    const/4 v8, 0x0

    .line 37
    aput v8, v6, v4

    .line 38
    .line 39
    sget-object v9, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 40
    .line 41
    invoke-static {v3, v9, v6}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    const-wide/16 v10, 0x12c

    .line 46
    .line 47
    invoke-virtual {v3, v10, v11}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    iget-object v6, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->l:Landroid/widget/TextView;

    .line 51
    .line 52
    new-array v12, v5, [F

    .line 53
    .line 54
    fill-array-data v12, :array_0

    .line 55
    .line 56
    .line 57
    sget-object v13, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 58
    .line 59
    invoke-static {v6, v13, v12}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-virtual {v6, v10, v11}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    const/16 v12, 0x3e8

    .line 67
    .line 68
    invoke-static {v12}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 69
    .line 70
    .line 71
    move-result-object v12

    .line 72
    iget-object v14, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->l:Landroid/widget/TextView;

    .line 73
    .line 74
    const/high16 v15, 0x41200000    # 10.0f

    .line 75
    .line 76
    invoke-static {v15}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v15

    .line 80
    neg-int v15, v15

    .line 81
    int-to-float v15, v15

    .line 82
    move/from16 v16, v4

    .line 83
    .line 84
    new-array v4, v5, [F

    .line 85
    .line 86
    aput v8, v4, v7

    .line 87
    .line 88
    aput v15, v4, v16

    .line 89
    .line 90
    invoke-static {v14, v9, v4}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-virtual {v4, v10, v11}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 95
    .line 96
    .line 97
    iget-object v8, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->l:Landroid/widget/TextView;

    .line 98
    .line 99
    new-array v9, v5, [F

    .line 100
    .line 101
    fill-array-data v9, :array_1

    .line 102
    .line 103
    .line 104
    invoke-static {v8, v13, v9}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    invoke-virtual {v8, v10, v11}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 109
    .line 110
    .line 111
    filled-new-array {v3, v6}, [Landroid/animation/Animator;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 116
    .line 117
    .line 118
    filled-new-array {v4, v8}, [Landroid/animation/Animator;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 123
    .line 124
    .line 125
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->E:Landroid/animation/AnimatorSet;

    .line 126
    .line 127
    const/4 v4, 0x3

    .line 128
    new-array v4, v4, [Landroid/animation/Animator;

    .line 129
    .line 130
    aput-object v1, v4, v7

    .line 131
    .line 132
    aput-object v12, v4, v16

    .line 133
    .line 134
    aput-object v2, v4, v5

    .line 135
    .line 136
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 137
    .line 138
    .line 139
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->E:Landroid/animation/AnimatorSet;

    .line 140
    .line 141
    new-instance v2, Ll/h3k;

    .line 142
    .line 143
    invoke-direct {v2, v0}, Ll/h3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 144
    .line 145
    .line 146
    new-instance v3, Ll/i3k;

    .line 147
    .line 148
    invoke-direct {v3, v0}, Ll/i3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 149
    .line 150
    .line 151
    invoke-static {v1, v2, v3}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 152
    .line 153
    .line 154
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->E:Landroid/animation/AnimatorSet;

    .line 155
    .line 156
    return-object v0

    .line 157
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->R0()V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->Q0()V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "noble"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->P0()V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->e1()V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->Y0()V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->O0()V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->V0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->U0()V

    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->L0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->T0()V

    return-void
.end method

.method private setProgress(D)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->e:Landroid/view/View;

    .line 2
    .line 3
    filled-new-array {v0}, [Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->e:Landroid/view/View;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->w:D

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->d:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    int-to-double v0, v0

    .line 26
    mul-double/2addr p1, v0

    .line 27
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->F:I

    .line 28
    .line 29
    int-to-double v2, v2

    .line 30
    add-double/2addr p1, v2

    .line 31
    const/high16 v2, 0x40e00000    # 7.0f

    .line 32
    .line 33
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    int-to-double v2, v2

    .line 38
    add-double/2addr p1, v2

    .line 39
    cmpl-double v2, p1, v0

    .line 40
    .line 41
    if-ltz v2, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move-wide v0, p1

    .line 45
    :goto_0
    double-to-int p1, v0

    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->e:Landroid/view/View;

    .line 47
    .line 48
    filled-new-array {p0}, [Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p1, p0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->Z0()V

    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->N0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic v0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->S0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic w0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->d1()V

    return-void
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->X0()V

    return-void
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->a1()V

    return-void
.end method


# virtual methods
.method public final D0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q3k;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final E0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->B:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->D:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->C:Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    invoke-static {p0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final I0()Landroid/animation/AnimatorSet;
    .locals 13

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->q:Lv/VDraweeView;

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    new-array v3, v2, [F

    .line 10
    .line 11
    fill-array-data v3, :array_0

    .line 12
    .line 13
    .line 14
    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 15
    .line 16
    invoke-static {v1, v4, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-wide/16 v5, 0x12c

    .line 21
    .line 22
    invoke-virtual {v1, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->q:Lv/VDraweeView;

    .line 26
    .line 27
    const/high16 v7, 0x40e00000    # 7.0f

    .line 28
    .line 29
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v8

    .line 33
    neg-int v8, v8

    .line 34
    int-to-float v8, v8

    .line 35
    new-array v9, v2, [F

    .line 36
    .line 37
    const/4 v10, 0x0

    .line 38
    const/4 v11, 0x0

    .line 39
    aput v11, v9, v10

    .line 40
    .line 41
    const/4 v12, 0x1

    .line 42
    aput v8, v9, v12

    .line 43
    .line 44
    sget-object v8, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 45
    .line 46
    invoke-static {v3, v8, v9}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v3, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 51
    .line 52
    .line 53
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->r:Lv/VDraweeView;

    .line 54
    .line 55
    new-array v6, v2, [F

    .line 56
    .line 57
    fill-array-data v6, :array_1

    .line 58
    .line 59
    .line 60
    invoke-static {v5, v4, v6}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    const-wide/16 v5, 0x258

    .line 65
    .line 66
    invoke-virtual {v4, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    iget-object v9, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->r:Lv/VDraweeView;

    .line 70
    .line 71
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v7

    .line 75
    int-to-float v7, v7

    .line 76
    new-array v2, v2, [F

    .line 77
    .line 78
    aput v7, v2, v10

    .line 79
    .line 80
    aput v11, v2, v12

    .line 81
    .line 82
    invoke-static {v9, v8, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v2, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-virtual {v3, v1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1, v4}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 102
    .line 103
    .line 104
    new-instance v1, Ll/p3k;

    .line 105
    .line 106
    invoke-direct {v1, p0}, Ll/p3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 107
    .line 108
    .line 109
    new-instance v2, Ll/z2k;

    .line 110
    .line 111
    invoke-direct {v2, p0}, Ll/z2k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 112
    .line 113
    .line 114
    invoke-static {v0, v1, v2}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 115
    .line 116
    .line 117
    return-object v0

    .line 118
    nop

    .line 119
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final J0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;)Landroid/animation/Animator;
    .locals 8

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;->b()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->u:J

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    move v0, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v1

    .line 16
    :goto_0
    new-instance v3, Ll/j3k;

    .line 17
    .line 18
    invoke-direct {v3, p0}, Ll/j3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 19
    .line 20
    .line 21
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->w:D

    .line 22
    .line 23
    const/4 p0, 0x2

    .line 24
    const-wide/16 v6, 0xc8

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    double-to-float v0, v4

    .line 29
    new-array v4, p0, [F

    .line 30
    .line 31
    aput v0, v4, v1

    .line 32
    .line 33
    const/high16 v0, 0x3f800000    # 1.0f

    .line 34
    .line 35
    aput v0, v4, v2

    .line 36
    .line 37
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;->c()F

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    new-array v4, p0, [F

    .line 52
    .line 53
    const/4 v5, 0x0

    .line 54
    aput v5, v4, v1

    .line 55
    .line 56
    aput p1, v4, v2

    .line 57
    .line 58
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 66
    .line 67
    .line 68
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 69
    .line 70
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 71
    .line 72
    .line 73
    new-array p0, p0, [Landroid/animation/Animator;

    .line 74
    .line 75
    aput-object v0, p0, v1

    .line 76
    .line 77
    aput-object p1, p0, v2

    .line 78
    .line 79
    invoke-virtual {v3, p0}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 80
    .line 81
    .line 82
    return-object v3

    .line 83
    :cond_1
    double-to-float v0, v4

    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;->c()F

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    new-array p0, p0, [F

    .line 89
    .line 90
    aput v0, p0, v1

    .line 91
    .line 92
    aput p1, p0, v2

    .line 93
    .line 94
    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 102
    .line 103
    .line 104
    return-object p0
.end method

.method public final K0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;Z)Ljava/lang/String;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StringFormatMatches"
        }
    .end annotation

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->T4:I

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;->a()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;->d()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    const-wide/16 v2, 0x1

    .line 22
    .line 23
    cmp-long p0, v0, v2

    .line 24
    .line 25
    if-ltz p0, :cond_0

    .line 26
    .line 27
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->V4:I

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;->a()J

    .line 30
    .line 31
    .line 32
    move-result-wide p1

    .line 33
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p0, p1}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->U4:I

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;->a()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;->b()J

    .line 61
    .line 62
    .line 63
    move-result-wide v0

    .line 64
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p0, p1}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    :cond_1
    return-object p0
.end method

.method public final synthetic L0(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic N0(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic O0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic P0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->getNobleInfo()Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vwt;->h7()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->m:Ll/bjs;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/xt40;->b(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic Q0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->q:Lv/VDraweeView;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->r:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic R0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->q:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->r:Lv/VDraweeView;

    .line 4
    .line 5
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->q:Lv/VDraweeView;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->r:Lv/VDraweeView;

    .line 8
    .line 9
    return-void
.end method

.method public final synthetic S0(Landroid/animation/ValueAnimator;)V
    .locals 2

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
    float-to-double v0, p1

    .line 12
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->setProgress(D)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic T0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->A:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->E0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->o1(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic U0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->A:Z

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->o1(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->q1()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic V0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->m:Ll/bjs;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->jumpSchema:Ljava/lang/String;

    .line 6
    .line 7
    const/16 v0, 0x2bc

    .line 8
    .line 9
    invoke-virtual {p1, v0, p0}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic Y0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->A:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->o1(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k:Landroid/widget/TextView;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->n1(Ljava/lang/String;Landroid/widget/TextView;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final synthetic Z0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->A:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k:Landroid/widget/TextView;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic a1()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->A:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->B:Landroid/animation/Animator;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->t:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->b()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->E0()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->n:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->s:Landroid/animation/Animator;

    .line 15
    .line 16
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->p:Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->o:Landroid/animation/AnimatorSet;

    .line 25
    .line 26
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->E:Landroid/animation/AnimatorSet;

    .line 30
    .line 31
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->n:Landroid/animation/AnimatorSet;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->s:Landroid/animation/Animator;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->p:Landroid/animation/AnimatorSet;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->o:Landroid/animation/AnimatorSet;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->E:Landroid/animation/AnimatorSet;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 46
    .line 47
    sget v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->G:I

    .line 48
    .line 49
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 50
    .line 51
    .line 52
    const/high16 v0, 0x3f800000    # 1.0f

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 55
    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    const/4 v0, 0x1

    .line 62
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->y:Z

    .line 63
    .line 64
    return-void
.end method

.method public final synthetic d1()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->A:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->o1(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k:Landroid/widget/TextView;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k:Landroid/widget/TextView;

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->n1(Ljava/lang/String;Landroid/widget/TextView;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final synthetic e1()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->A:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k:Landroid/widget/TextView;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k:Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final f1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->jumpSchema:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->d:Landroid/view/View;

    .line 13
    .line 14
    new-instance v1, Ll/g3k;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/g3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final g1(JLv/VDraweeView;Ll/x20;)V
    .locals 3

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->u:J

    .line 2
    .line 3
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/hiv;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    invoke-static {p3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 v1, 0x1

    .line 23
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    const-wide/16 v1, 0x0

    .line 27
    .line 28
    cmp-long p1, p1, v1

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->zeroGradeBackendUrl:Ljava/lang/String;

    .line 38
    .line 39
    :goto_0
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView$a;

    .line 40
    .line 41
    invoke-direct {p2, p0, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;Lv/VDraweeView;Ll/x20;)V

    .line 42
    .line 43
    .line 44
    const-string p0, "context_livingAct"

    .line 45
    .line 46
    invoke-static {p0, p3, p1, p2}, Ll/izs;->w(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public getNobleInfo()Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->buttons:Ljava/util/List;

    .line 6
    .line 7
    new-instance v0, Ll/y2k;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/y2k;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final h1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->buttons:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/vwt;->h7()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->m:Ll/bjs;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/bjs;->isShowing()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->y:Z

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->m:Ll/bjs;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Ll/xt40;->b(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->y:Z

    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/noble/GiftDialogNobelEntranceView;

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->d:Landroid/view/View;

    .line 53
    .line 54
    sget v1, Ll/qa00;->h:I

    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/noble/GiftDialogNobelEntranceView;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->m:Ll/bjs;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->buttons:Ljava/util/List;

    .line 66
    .line 67
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/noble/GiftDialogNobelEntranceView;->T(Ll/bjs;Ljava/util/List;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/noble/GiftDialogNobelEntranceView;

    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->d:Landroid/view/View;

    .line 77
    .line 78
    sget v0, Ll/qa00;->l:I

    .line 79
    .line 80
    invoke-static {p0, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final j1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->d:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p3}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    invoke-static {p4}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    const/4 v1, 0x6

    .line 12
    invoke-static {p3, p4, v1}, Ll/fc2;->j(III)Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-virtual {v0, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->e:Landroid/view/View;

    .line 20
    .line 21
    invoke-static {p1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {p2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    invoke-static {p1, p2, v1}, Ll/fc2;->j(III)Landroid/graphics/drawable/GradientDrawable;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final k1()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->E0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->z:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->z:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ljava/lang/CharSequence;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->z:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-le v1, v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->p1()V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void

    .line 49
    :cond_1
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k:Landroid/widget/TextView;

    .line 53
    .line 54
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public l1(Ll/bjs;Ll/kpj;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;",
            "Ll/kpj;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->m:Ll/bjs;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/kpj;->i()Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 8
    .line 9
    iget-wide p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->grade:J

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->q:Lv/VDraweeView;

    .line 12
    .line 13
    new-instance v1, Ll/c3k;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/c3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->g1(JLv/VDraweeView;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->h1()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->f1()V

    .line 25
    .line 26
    .line 27
    new-instance p1, Ljava/util/ArrayList;

    .line 28
    .line 29
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->progressTexts:Ljava/util/List;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->z:Ljava/util/List;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k1()V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->style:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgressStyle;

    .line 44
    .line 45
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgressStyle;->startColor:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgressStyle;->endColor:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgressStyle;->bgStartColor:Ljava/lang/String;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgressStyle;->bgEndColor:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0, p2, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->x:Z

    .line 57
    .line 58
    if-eqz p1, :cond_0

    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    sget p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->G:I

    .line 66
    .line 67
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final n1(Ljava/lang/String;Landroid/widget/TextView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->z:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/a3k;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/a3k;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->z:Ljava/util/List;

    .line 13
    .line 14
    add-int/lit8 p1, p1, 0x1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    rem-int/2addr p1, v0

    .line 21
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ljava/lang/CharSequence;

    .line 26
    .line 27
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final o1(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v1, 0x0

    .line 9
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->l:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 18
    .line 19
    xor-int/lit8 v1, p1, 0x1

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k:Landroid/widget/TextView;

    .line 25
    .line 26
    xor-int/lit8 p1, p1, 0x1

    .line 27
    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->D0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->f:Lv/VDraweeView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->q:Lv/VDraweeView;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->g:Lv/VDraweeView;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->r:Lv/VDraweeView;

    .line 14
    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->r:Lv/VDraweeView;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->d:Landroid/view/View;

    .line 27
    .line 28
    const/high16 v1, 0x40c00000    # 6.0f

    .line 29
    .line 30
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-static {v0, v2}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->e:Landroid/view/View;

    .line 38
    .line 39
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final p1()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->C:Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->C:Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k:Landroid/widget/TextView;

    .line 25
    .line 26
    const/high16 v4, 0x41200000    # 10.0f

    .line 27
    .line 28
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    int-to-float v5, v5

    .line 33
    const/4 v6, 0x2

    .line 34
    new-array v7, v6, [F

    .line 35
    .line 36
    const/4 v8, 0x0

    .line 37
    aput v5, v7, v8

    .line 38
    .line 39
    const/4 v5, 0x1

    .line 40
    const/4 v9, 0x0

    .line 41
    aput v9, v7, v5

    .line 42
    .line 43
    sget-object v10, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 44
    .line 45
    invoke-static {v3, v10, v7}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    const-wide/16 v11, 0x12c

    .line 50
    .line 51
    invoke-virtual {v3, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    iget-object v7, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k:Landroid/widget/TextView;

    .line 55
    .line 56
    new-array v13, v6, [F

    .line 57
    .line 58
    fill-array-data v13, :array_0

    .line 59
    .line 60
    .line 61
    sget-object v14, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 62
    .line 63
    invoke-static {v7, v14, v13}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    invoke-virtual {v7, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 71
    .line 72
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v15

    .line 76
    neg-int v15, v15

    .line 77
    int-to-float v15, v15

    .line 78
    move/from16 v16, v4

    .line 79
    .line 80
    new-array v4, v6, [F

    .line 81
    .line 82
    aput v9, v4, v8

    .line 83
    .line 84
    aput v15, v4, v5

    .line 85
    .line 86
    invoke-static {v13, v10, v4}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-virtual {v4, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 91
    .line 92
    .line 93
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 94
    .line 95
    new-array v15, v6, [F

    .line 96
    .line 97
    fill-array-data v15, :array_1

    .line 98
    .line 99
    .line 100
    invoke-static {v13, v14, v15}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    move-result-object v13

    .line 104
    invoke-virtual {v13, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    filled-new-array {v3, v7}, [Landroid/animation/Animator;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 112
    .line 113
    .line 114
    filled-new-array {v4, v13}, [Landroid/animation/Animator;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 119
    .line 120
    .line 121
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->C:Landroid/animation/AnimatorSet;

    .line 122
    .line 123
    new-array v4, v6, [Landroid/animation/Animator;

    .line 124
    .line 125
    aput-object v1, v4, v8

    .line 126
    .line 127
    aput-object v2, v4, v5

    .line 128
    .line 129
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 130
    .line 131
    .line 132
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 133
    .line 134
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 135
    .line 136
    .line 137
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->D:Landroid/animation/AnimatorSet;

    .line 138
    .line 139
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 140
    .line 141
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 142
    .line 143
    .line 144
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 145
    .line 146
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 147
    .line 148
    .line 149
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 150
    .line 151
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    int-to-float v4, v4

    .line 156
    new-array v7, v6, [F

    .line 157
    .line 158
    aput v4, v7, v8

    .line 159
    .line 160
    aput v9, v7, v5

    .line 161
    .line 162
    invoke-static {v3, v10, v7}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-virtual {v3, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 167
    .line 168
    .line 169
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j:Landroid/widget/TextView;

    .line 170
    .line 171
    new-array v7, v6, [F

    .line 172
    .line 173
    fill-array-data v7, :array_2

    .line 174
    .line 175
    .line 176
    invoke-static {v4, v14, v7}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    invoke-virtual {v4, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 181
    .line 182
    .line 183
    iget-object v7, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k:Landroid/widget/TextView;

    .line 184
    .line 185
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 186
    .line 187
    .line 188
    move-result v13

    .line 189
    neg-int v13, v13

    .line 190
    int-to-float v13, v13

    .line 191
    new-array v15, v6, [F

    .line 192
    .line 193
    aput v9, v15, v8

    .line 194
    .line 195
    aput v13, v15, v5

    .line 196
    .line 197
    invoke-static {v7, v10, v15}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 198
    .line 199
    .line 200
    move-result-object v7

    .line 201
    invoke-virtual {v7, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 202
    .line 203
    .line 204
    iget-object v9, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k:Landroid/widget/TextView;

    .line 205
    .line 206
    new-array v10, v6, [F

    .line 207
    .line 208
    fill-array-data v10, :array_3

    .line 209
    .line 210
    .line 211
    invoke-static {v9, v14, v10}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 212
    .line 213
    .line 214
    move-result-object v9

    .line 215
    invoke-virtual {v9, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 216
    .line 217
    .line 218
    filled-new-array {v3, v4}, [Landroid/animation/Animator;

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 223
    .line 224
    .line 225
    filled-new-array {v7, v9}, [Landroid/animation/Animator;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 230
    .line 231
    .line 232
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->D:Landroid/animation/AnimatorSet;

    .line 233
    .line 234
    new-array v4, v6, [Landroid/animation/Animator;

    .line 235
    .line 236
    aput-object v1, v4, v8

    .line 237
    .line 238
    aput-object v2, v4, v5

    .line 239
    .line 240
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 241
    .line 242
    .line 243
    const/16 v1, 0xbb8

    .line 244
    .line 245
    invoke-static {v1}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    invoke-static {v1}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->C:Landroid/animation/AnimatorSet;

    .line 254
    .line 255
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->D:Landroid/animation/AnimatorSet;

    .line 256
    .line 257
    const/4 v7, 0x4

    .line 258
    new-array v7, v7, [Landroid/animation/Animator;

    .line 259
    .line 260
    aput-object v2, v7, v8

    .line 261
    .line 262
    aput-object v3, v7, v5

    .line 263
    .line 264
    aput-object v1, v7, v6

    .line 265
    .line 266
    const/4 v1, 0x3

    .line 267
    aput-object v4, v7, v1

    .line 268
    .line 269
    invoke-static {v7}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->B:Landroid/animation/Animator;

    .line 274
    .line 275
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->C:Landroid/animation/AnimatorSet;

    .line 276
    .line 277
    new-instance v2, Ll/k3k;

    .line 278
    .line 279
    invoke-direct {v2, v0}, Ll/k3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 280
    .line 281
    .line 282
    new-instance v3, Ll/l3k;

    .line 283
    .line 284
    invoke-direct {v3, v0}, Ll/l3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 285
    .line 286
    .line 287
    invoke-static {v1, v2, v3}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 288
    .line 289
    .line 290
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->D:Landroid/animation/AnimatorSet;

    .line 291
    .line 292
    new-instance v2, Ll/m3k;

    .line 293
    .line 294
    invoke-direct {v2, v0}, Ll/m3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 295
    .line 296
    .line 297
    new-instance v3, Ll/n3k;

    .line 298
    .line 299
    invoke-direct {v3, v0}, Ll/n3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 300
    .line 301
    .line 302
    invoke-static {v1, v2, v3}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 303
    .line 304
    .line 305
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->B:Landroid/animation/Animator;

    .line 306
    .line 307
    new-instance v2, Ll/o3k;

    .line 308
    .line 309
    invoke-direct {v2, v0}, Ll/o3k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;)V

    .line 310
    .line 311
    .line 312
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 313
    .line 314
    .line 315
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->B:Landroid/animation/Animator;

    .line 316
    .line 317
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 318
    .line 319
    .line 320
    return-void

    .line 321
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 322
    .line 323
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final q1()V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StringFormatMatches"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->A:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->t:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->c()Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->k1()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->J0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->s:Landroid/animation/Animator;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->E:Landroid/animation/AnimatorSet;

    .line 25
    .line 26
    if-nez v1, :cond_2

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->getNoticeTextAnim()Landroid/animation/AnimatorSet;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->E:Landroid/animation/AnimatorSet;

    .line 33
    .line 34
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;->b()J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->u:J

    .line 39
    .line 40
    cmp-long v1, v1, v3

    .line 41
    .line 42
    if-lez v1, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    goto :goto_0

    .line 46
    :cond_3
    const/4 v1, 0x0

    .line 47
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->l:Landroid/widget/TextView;

    .line 48
    .line 49
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->K0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;Z)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->s:Landroid/animation/Animator;

    .line 57
    .line 58
    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->E:Landroid/animation/AnimatorSet;

    .line 62
    .line 63
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 64
    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->I0()Landroid/animation/AnimatorSet;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->n:Landroid/animation/AnimatorSet;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;->b()J

    .line 75
    .line 76
    .line 77
    move-result-wide v0

    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->r:Lv/VDraweeView;

    .line 79
    .line 80
    const/4 v3, 0x0

    .line 81
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->g1(JLv/VDraweeView;Ll/x20;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->n:Landroid/animation/AnimatorSet;

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 87
    .line 88
    .line 89
    :cond_4
    :goto_1
    return-void
.end method

.method public r1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->p:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->G0()Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->p:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->p:Landroid/animation/AnimatorSet;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public s1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->o:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->H0()Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->o:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->o:Landroid/animation/AnimatorSet;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->x:Z

    .line 23
    .line 24
    return-void
.end method

.method public setPacketPanelShowingFlag(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->x:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->v:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public t1(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->m:Ll/bjs;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/bjs;->isShowing()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->t:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->a(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getProgressTextsList()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->z:Ljava/util/List;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->q1()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->u1(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 33
    .line 34
    .line 35
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getStyle()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;->getStartColor()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getStyle()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;->getEndColor()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getStyle()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;->getBgStartColor()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getStyle()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;->getBgEndColor()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->j1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final u1(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getGrade()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->q:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->g1(JLv/VDraweeView;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getWealthRatio()D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->setProgress(D)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
