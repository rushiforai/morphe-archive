.class public Ll/pci;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Landroid/widget/PopupWindow;

.field public static b:Z

.field public static c:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static d:Lcom/p1/mobile/putong/data/User;

.field public static e:J

.field public static f:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public static g:Lv/VDraweeView;

.field public static h:Lv/VDraweeView;

.field public static i:Lv/VDraweeView;

.field public static j:Landroid/widget/TextView;

.field public static k:Landroid/widget/TextView;

.field public static l:Landroid/widget/FrameLayout;

.field public static m:Landroid/widget/ImageView;

.field public static n:Landroid/widget/ImageView;

.field public static o:Landroid/view/View;

.field public static p:Lcom/tantan/library/svga/SVGAnimationView;

.field public static q:Landroid/view/GestureDetector;

.field public static r:J

.field public static s:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/jci;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jci;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/pci;->s:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A()V
    .locals 5

    .line 1
    sget-object v0, Ll/pci;->s:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/high16 v1, 0x43160000    # 150.0f

    .line 13
    .line 14
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    neg-int v1, v1

    .line 19
    int-to-float v1, v1

    .line 20
    const/4 v2, 0x2

    .line 21
    new-array v2, v2, [F

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    const/4 v4, 0x0

    .line 25
    aput v3, v2, v4

    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    aput v1, v2, v3

    .line 29
    .line 30
    const-string v1, "translationY"

    .line 31
    .line 32
    invoke-static {v0, v1, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-wide/16 v1, 0xc8

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    .line 42
    .line 43
    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 47
    .line 48
    .line 49
    new-instance v1, Ll/pci$c;

    .line 50
    .line 51
    invoke-direct {v1, v0}, Ll/pci$c;-><init>(Landroid/animation/Animator;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static B()I
    .locals 1

    .line 1
    sget v0, Ll/kec0;->g8:I

    .line 2
    .line 3
    return v0
.end method

.method public static C(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    sget-object v0, Ll/pci;->d:Lcom/p1/mobile/putong/data/User;

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
    sget-object v0, Ll/pci;->d:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {p0, v0, v2, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    const-string p0, "e_female_match_toast_hide"

    .line 23
    .line 24
    const-string v0, "p_suggest_users_home_view"

    .line 25
    .line 26
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    sget-object p0, Ll/pci;->s:Ljava/lang/Runnable;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    sget-object p0, Ll/pci;->s:Ljava/lang/Runnable;

    .line 38
    .line 39
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    sget-object p0, Ll/pci;->s:Ljava/lang/Runnable;

    .line 43
    .line 44
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public static D()Z
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    return v0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    return v0
.end method

.method public static E()Z
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

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
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    return v0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    return v0
.end method

.method public static F(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/pci;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p0, p1}, Ll/pci;->I(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ll/pci;->i:Lv/VDraweeView;

    .line 12
    .line 13
    const/high16 v1, 0x41200000    # 10.0f

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    neg-int v1, v1

    .line 20
    int-to-float v1, v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "https://auto.tancdn.com/v1/raw/43f6acda-0599-43c7-95cb-4b2b00f758ba11.so"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget-object v1, Ll/pci;->p:Lcom/tantan/library/svga/SVGAnimationView;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Ll/nci;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/nci;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    sput-object p0, Ll/pci;->d:Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    new-instance p0, Ll/oci;

    .line 59
    .line 60
    invoke-direct {p0, p1}, Ll/oci;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 61
    .line 62
    .line 63
    const-wide/16 v0, 0x7d0

    .line 64
    .line 65
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public static G()V
    .locals 21

    .line 1
    invoke-static {}, Ll/pci;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v7, Ll/fzf0;

    .line 9
    .line 10
    const/high16 v0, 0x3f000000    # 0.5f

    .line 11
    .line 12
    invoke-direct {v7, v0}, Ll/fzf0;-><init>(F)V

    .line 13
    .line 14
    .line 15
    sget-object v1, Ll/pci;->g:Lv/VDraweeView;

    .line 16
    .line 17
    sget-object v2, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 18
    .line 19
    const/high16 v0, 0x41f00000    # 30.0f

    .line 20
    .line 21
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    neg-int v3, v3

    .line 26
    int-to-float v3, v3

    .line 27
    const/high16 v9, 0x41200000    # 10.0f

    .line 28
    .line 29
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    int-to-float v4, v4

    .line 34
    const/4 v10, 0x2

    .line 35
    new-array v8, v10, [F

    .line 36
    .line 37
    const/4 v11, 0x0

    .line 38
    aput v3, v8, v11

    .line 39
    .line 40
    const/4 v12, 0x1

    .line 41
    aput v4, v8, v12

    .line 42
    .line 43
    const-wide/16 v3, 0xc8

    .line 44
    .line 45
    const-wide/16 v5, 0x5dc

    .line 46
    .line 47
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object v13

    .line 51
    sget-object v1, Ll/pci;->h:Lv/VDraweeView;

    .line 52
    .line 53
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    int-to-float v0, v0

    .line 58
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v8

    .line 62
    neg-int v8, v8

    .line 63
    int-to-float v8, v8

    .line 64
    move v9, v8

    .line 65
    new-array v8, v10, [F

    .line 66
    .line 67
    aput v0, v8, v11

    .line 68
    .line 69
    aput v9, v8, v12

    .line 70
    .line 71
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/pci$d;

    .line 76
    .line 77
    invoke-direct {v1}, Ll/pci$d;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v13, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 81
    .line 82
    .line 83
    move-object v1, v13

    .line 84
    sget-object v13, Ll/pci;->g:Lv/VDraweeView;

    .line 85
    .line 86
    sget-object v14, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 87
    .line 88
    new-instance v19, Landroid/view/animation/LinearInterpolator;

    .line 89
    .line 90
    invoke-direct/range {v19 .. v19}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 91
    .line 92
    .line 93
    new-array v2, v10, [F

    .line 94
    .line 95
    fill-array-data v2, :array_0

    .line 96
    .line 97
    .line 98
    const-wide/16 v17, 0x64

    .line 99
    .line 100
    move-object/from16 v20, v2

    .line 101
    .line 102
    move-wide v15, v3

    .line 103
    invoke-static/range {v13 .. v20}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    sget-object v13, Ll/pci;->h:Lv/VDraweeView;

    .line 108
    .line 109
    new-instance v19, Landroid/view/animation/LinearInterpolator;

    .line 110
    .line 111
    invoke-direct/range {v19 .. v19}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 112
    .line 113
    .line 114
    new-array v5, v10, [F

    .line 115
    .line 116
    fill-array-data v5, :array_1

    .line 117
    .line 118
    .line 119
    move-object/from16 v20, v5

    .line 120
    .line 121
    invoke-static/range {v13 .. v20}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    filled-new-array {v1, v0, v2, v3}, [Landroid/animation/Animator;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static H(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;IZ)V
    .locals 6

    .line 1
    sget-object p2, Ll/pci;->q:Landroid/view/GestureDetector;

    if-nez p2, :cond_0

    .line 2
    new-instance p2, Landroid/view/GestureDetector;

    new-instance v0, Ll/pci$a;

    invoke-direct {v0, p0}, Ll/pci$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    invoke-direct {p2, p0, v0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    sput-object p2, Ll/pci;->q:Landroid/view/GestureDetector;

    .line 3
    :cond_0
    sget-object p2, Ll/pci;->a:Landroid/widget/PopupWindow;

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result p2

    if-eqz p2, :cond_1

    if-nez p3, :cond_1

    return-void

    :cond_1
    const/4 p2, 0x1

    .line 4
    invoke-static {p2}, Ll/ydi;->l(Z)V

    .line 5
    sget-object v0, Ll/pci;->s:Ljava/lang/Runnable;

    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 6
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 7
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sput-wide v2, Ll/pci;->e:J

    .line 8
    const-string v0, "e_female_match_toast_hide"

    const-string v2, "p_suggest_users_home_view"

    invoke-static {v0, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    new-instance v0, Landroid/widget/PopupWindow;

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object v2

    invoke-static {}, Ll/pci;->B()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 11
    invoke-static {}, Ll/bnl0;->y0()I

    move-result v3

    const/high16 v4, 0x433e0000    # 190.0f

    .line 12
    invoke-static {v4}, Ll/qa00;->d(F)I

    move-result v4

    invoke-direct {v0, v2, v3, v4, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    sput-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    .line 13
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Ll/adc0;->n0:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    sput-object v0, Ll/pci;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    invoke-virtual {v0, p2}, Landroid/view/View;->setClickable(Z)V

    .line 15
    sget-object v0, Ll/pci;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v2, Ll/pci$b;

    invoke-direct {v2}, Ll/pci$b;-><init>()V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 16
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    .line 17
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Ll/adc0;->Z7:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/VDraweeView;

    sput-object v0, Ll/pci;->g:Lv/VDraweeView;

    .line 18
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Ll/adc0;->a8:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/VDraweeView;

    sput-object v0, Ll/pci;->h:Lv/VDraweeView;

    .line 19
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    .line 20
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Ll/adc0;->b8:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/VDraweeView;

    sput-object v0, Ll/pci;->i:Lv/VDraweeView;

    .line 21
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Ll/adc0;->c8:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sput-object v0, Ll/pci;->j:Landroid/widget/TextView;

    .line 22
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Ll/adc0;->Y7:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sput-object v0, Ll/pci;->k:Landroid/widget/TextView;

    .line 23
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Ll/adc0;->ud:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    sput-object v0, Ll/pci;->p:Lcom/tantan/library/svga/SVGAnimationView;

    .line 24
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Ll/adc0;->L9:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    sput-object v0, Ll/pci;->l:Landroid/widget/FrameLayout;

    .line 25
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Ll/adc0;->N9:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    sput-object v0, Ll/pci;->m:Landroid/widget/ImageView;

    .line 26
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Ll/adc0;->M9:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    sput-object v0, Ll/pci;->n:Landroid/widget/ImageView;

    .line 27
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Ll/adc0;->b9:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sput-object v0, Ll/pci;->o:Landroid/view/View;

    .line 28
    :cond_2
    sget-object v0, Ll/pci;->j:Landroid/widget/TextView;

    const/4 v2, 0x3

    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 29
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 30
    sget-object p0, Ll/pci;->c:Ljava/util/LinkedList;

    if-nez p0, :cond_3

    .line 31
    new-instance p0, Ljava/util/LinkedList;

    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    sput-object p0, Ll/pci;->c:Ljava/util/LinkedList;

    .line 32
    :cond_3
    sget-object p0, Ll/pci;->c:Ljava/util/LinkedList;

    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void

    .line 33
    :cond_4
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 34
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v2, "dimen"

    const-string v3, "android"

    .line 35
    const-string v4, "status_bar_height"

    invoke-virtual {v0, v4, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_5

    .line 36
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto :goto_0

    :cond_5
    move v0, v1

    .line 37
    :goto_0
    sget-object v2, Ll/pci;->a:Landroid/widget/PopupWindow;

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v2

    invoke-static {v2, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 38
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x22

    const/16 v4, 0x31

    if-le v2, v3, :cond_6

    .line 39
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    .line 40
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    .line 41
    invoke-static {}, Ll/bnl0;->F0()I

    move-result v3

    const/high16 v5, 0x42700000    # 60.0f

    invoke-static {v5}, Ll/qa00;->d(F)I

    move-result v5

    sub-int/2addr v3, v5

    .line 42
    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    goto :goto_1

    .line 43
    :cond_6
    sget-object v2, Ll/pci;->a:Landroid/widget/PopupWindow;

    .line 44
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    neg-int v0, v0

    .line 45
    invoke-virtual {v2, v3, v4, v1, v0}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 46
    :goto_1
    invoke-static {p1, p0}, Ll/pci;->I(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V

    .line 47
    sput-object p1, Ll/pci;->d:Lcom/p1/mobile/putong/data/User;

    .line 48
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 49
    sget-object v0, Ll/pci;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v2, 0x2

    new-array v3, v2, [F

    fill-array-data v3, :array_0

    const-string v4, "alpha"

    invoke-static {v0, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 50
    sget-object v3, Ll/pci;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    const/high16 v4, 0x43400000    # 192.0f

    invoke-static {v4}, Ll/qa00;->d(F)I

    move-result v4

    neg-int v4, v4

    int-to-float v4, v4

    new-array v5, v2, [F

    aput v4, v5, v1

    const/4 v4, 0x0

    aput v4, v5, p2

    const-string v4, "translationY"

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 51
    new-instance v4, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v4}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    invoke-virtual {v3, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 52
    new-array v2, v2, [Landroid/animation/Animator;

    aput-object v0, v2, v1

    aput-object v3, v2, p2

    invoke-virtual {p1, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    const-wide/16 v0, 0x1f4

    .line 53
    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 54
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 55
    invoke-static {}, Ll/pci;->G()V

    if-eqz p3, :cond_7

    .line 56
    new-instance p1, Ll/lci;

    invoke-direct {p1, p0}, Ll/lci;-><init>(Lcom/p1/mobile/android/app/Act;)V

    const-wide/16 p2, 0xed8

    invoke-static {p0, p1, p2, p3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    return-void

    .line 57
    :cond_7
    new-instance p1, Ll/mci;

    invoke-direct {p1}, Ll/mci;-><init>()V

    const-wide/16 p2, 0xfa0

    invoke-static {p0, p1, p2, p3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static I(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x5

    .line 16
    if-le v1, v2, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "..."

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_0
    sget-object p0, Ll/pci;->k:Landroid/widget/TextView;

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v0, " "

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    sget v0, Lcom/p1/mobile/putong/core/R$string;->bi:I

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public static J(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/pci;->K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/pci;->L(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static L(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;IZ)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->n3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    const-string p3, ""

    .line 9
    .line 10
    invoke-static {p0, p1, p2, p3}, Ll/pdi;->b0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/hlh0;->e()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    new-instance v1, Ll/kci;

    .line 45
    .line 46
    invoke-direct {v1, p0, p1, p2, p3}, Ll/kci;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;IZ)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public static M(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 13

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Ll/pci;->r:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x1f4

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-gez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Ll/pci;->D()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    :goto_0
    return-void

    .line 22
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    sput-wide v0, Ll/pci;->r:J

    .line 27
    .line 28
    sget-object v0, Ll/pci;->i:Lv/VDraweeView;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 35
    .line 36
    sget-object v2, Ll/pci;->i:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-virtual {v0, v2, p0, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 39
    .line 40
    .line 41
    sget-object v3, Ll/pci;->h:Lv/VDraweeView;

    .line 42
    .line 43
    sget-object v4, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 44
    .line 45
    new-instance v9, Landroid/view/animation/DecelerateInterpolator;

    .line 46
    .line 47
    invoke-direct {v9}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 48
    .line 49
    .line 50
    const/high16 p0, 0x42700000    # 60.0f

    .line 51
    .line 52
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    int-to-float v0, v0

    .line 57
    const/4 v2, 0x2

    .line 58
    new-array v10, v2, [F

    .line 59
    .line 60
    const/4 v11, 0x0

    .line 61
    aput v11, v10, v1

    .line 62
    .line 63
    const/4 v12, 0x1

    .line 64
    aput v0, v10, v12

    .line 65
    .line 66
    const-wide/16 v5, 0x0

    .line 67
    .line 68
    const-wide/16 v7, 0x1f4

    .line 69
    .line 70
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sget-object v3, Ll/pci;->i:Lv/VDraweeView;

    .line 75
    .line 76
    new-instance v10, Landroid/view/animation/DecelerateInterpolator;

    .line 77
    .line 78
    invoke-direct {v10}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    neg-int p0, p0

    .line 86
    int-to-float p0, p0

    .line 87
    move v5, v11

    .line 88
    new-array v11, v2, [F

    .line 89
    .line 90
    aput p0, v11, v1

    .line 91
    .line 92
    aput v5, v11, v12

    .line 93
    .line 94
    const-wide/16 v6, 0x0

    .line 95
    .line 96
    const-wide/16 v8, 0x1f4

    .line 97
    .line 98
    move-object v5, v4

    .line 99
    move-object v4, v3

    .line 100
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    filled-new-array {v0, p0}, [Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    new-instance v0, Ll/pci$e;

    .line 113
    .line 114
    invoke-direct {v0}, Ll/pci$e;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 121
    .line 122
    .line 123
    sget-object v3, Ll/pci;->h:Lv/VDraweeView;

    .line 124
    .line 125
    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 126
    .line 127
    new-instance v9, Landroid/view/animation/DecelerateInterpolator;

    .line 128
    .line 129
    invoke-direct {v9}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 130
    .line 131
    .line 132
    new-array v10, v2, [F

    .line 133
    .line 134
    fill-array-data v10, :array_0

    .line 135
    .line 136
    .line 137
    const-wide/16 v5, 0x0

    .line 138
    .line 139
    const-wide/16 v7, 0xc8

    .line 140
    .line 141
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    sget-object v0, Ll/pci;->i:Lv/VDraweeView;

    .line 146
    .line 147
    new-instance v10, Landroid/view/animation/DecelerateInterpolator;

    .line 148
    .line 149
    invoke-direct {v10}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 150
    .line 151
    .line 152
    new-array v11, v2, [F

    .line 153
    .line 154
    fill-array-data v11, :array_1

    .line 155
    .line 156
    .line 157
    const-wide/16 v6, 0x0

    .line 158
    .line 159
    const-wide/16 v8, 0xc8

    .line 160
    .line 161
    move-object v5, v4

    .line 162
    move-object v4, v0

    .line 163
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    filled-new-array {p0, v0}, [Landroid/animation/Animator;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 176
    .line 177
    .line 178
    sget-object p0, Ll/pci;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 179
    .line 180
    sget-object v0, Ll/pci;->h:Lv/VDraweeView;

    .line 181
    .line 182
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    nop

    .line 187
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic a()V
    .locals 2

    .line 1
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/pci;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/x7c0;->f:I

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/pci$f;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/pci$f;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 23
    .line 24
    .line 25
    sget-object v1, Ll/pci;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    sput-object v0, Ll/pci;->c:Ljava/util/LinkedList;

    .line 32
    .line 33
    sput-object v0, Ll/pci;->d:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    sput-boolean v1, Ll/pci;->b:Z

    .line 37
    .line 38
    sput-object v0, Ll/pci;->q:Landroid/view/GestureDetector;

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/pci;->x(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    sget-object v0, Ll/pci;->c:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget-object v0, Ll/pci;->c:Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    :goto_0
    if-eqz v0, :cond_1

    .line 20
    .line 21
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v1, v0}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Ll/pci;->M(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;IZ)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/pci;->H(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/pci;->x(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/pci;->y(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic g()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/pci;->b:Z

    return v0
.end method

.method public static bridge synthetic h()Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->d:Lcom/p1/mobile/putong/data/User;

    return-object v0
.end method

.method public static bridge synthetic i()Landroid/view/GestureDetector;
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->q:Landroid/view/GestureDetector;

    return-object v0
.end method

.method public static bridge synthetic j()Ljava/lang/Runnable;
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->s:Ljava/lang/Runnable;

    return-object v0
.end method

.method public static bridge synthetic k()Lv/VDraweeView;
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->g:Lv/VDraweeView;

    return-object v0
.end method

.method public static bridge synthetic l()Lv/VDraweeView;
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->h:Lv/VDraweeView;

    return-object v0
.end method

.method public static bridge synthetic m()Lv/VDraweeView;
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->i:Lv/VDraweeView;

    return-object v0
.end method

.method public static bridge synthetic n()Landroid/widget/PopupWindow;
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    return-object v0
.end method

.method public static bridge synthetic o()Landroid/view/View;
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->o:Landroid/view/View;

    return-object v0
.end method

.method public static bridge synthetic p()Landroid/widget/FrameLayout;
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->l:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public static bridge synthetic q()Lcom/tantan/library/svga/SVGAnimationView;
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->p:Lcom/tantan/library/svga/SVGAnimationView;

    return-object v0
.end method

.method public static bridge synthetic r(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ll/pci;->b:Z

    return-void
.end method

.method public static bridge synthetic s(Lv/VDraweeView;)V
    .locals 0

    .line 1
    sput-object p0, Ll/pci;->h:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic t(Lv/VDraweeView;)V
    .locals 0

    .line 1
    sput-object p0, Ll/pci;->i:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic u(Landroid/widget/PopupWindow;)V
    .locals 0

    .line 1
    sput-object p0, Ll/pci;->a:Landroid/widget/PopupWindow;

    return-void
.end method

.method public static bridge synthetic v()V
    .locals 0

    .line 1
    invoke-static {}, Ll/pci;->A()V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/pci;->C(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static x(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget-object v0, Ll/pci;->a:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/pci;->c:Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Ll/pci;->c:Ljava/util/LinkedList;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    invoke-static {v0, p0}, Ll/pci;->F(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    invoke-static {p0}, Ll/pci;->y(Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static y(Z)V
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    sget-wide v2, Ll/pci;->e:J

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    const-wide/16 v2, 0xed8

    .line 11
    .line 12
    cmp-long p0, v0, v2

    .line 13
    .line 14
    if-gez p0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object p0, Ll/pci;->s:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    sget-object p0, Ll/pci;->s:Ljava/lang/Runnable;

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/pci;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    sput-object v0, Ll/pci;->g:Lv/VDraweeView;

    .line 5
    .line 6
    sput-object v0, Ll/pci;->h:Lv/VDraweeView;

    .line 7
    .line 8
    sput-object v0, Ll/pci;->i:Lv/VDraweeView;

    .line 9
    .line 10
    sput-object v0, Ll/pci;->j:Landroid/widget/TextView;

    .line 11
    .line 12
    sput-object v0, Ll/pci;->k:Landroid/widget/TextView;

    .line 13
    .line 14
    sput-object v0, Ll/pci;->p:Lcom/tantan/library/svga/SVGAnimationView;

    .line 15
    .line 16
    sput-object v0, Ll/pci;->l:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    sput-object v0, Ll/pci;->m:Landroid/widget/ImageView;

    .line 19
    .line 20
    sput-object v0, Ll/pci;->n:Landroid/widget/ImageView;

    .line 21
    .line 22
    sput-object v0, Ll/pci;->o:Landroid/view/View;

    .line 23
    .line 24
    return-void
.end method
