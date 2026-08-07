.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field private all:Landroid/animation/Animator;

.field private subs:Ll/kcg0;

.field private view1:Landroid/view/View;

.field private view2:Landroid/view/View;

.field private view3:Landroid/view/View;

.field viewList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private viewRender:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/Long;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->c(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic b(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 3
    .line 4
    .line 5
    const/high16 p0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    const p0, 0x3ecccccd    # 0.4f

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2, p0}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final synthetic c(Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-gez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewRender:Ll/z20;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/view/View;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewRender:Ll/z20;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Landroid/view/View;

    .line 38
    .line 39
    invoke-interface {v0, p1, v3}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Landroid/view/View;

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    .line 51
    .line 52
    const/4 v3, 0x2

    .line 53
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroid/view/View;

    .line 58
    .line 59
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Landroid/view/View;

    .line 66
    .line 67
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->d(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Landroid/view/View;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final d(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v7, Ll/zjg;

    .line 4
    .line 5
    invoke-direct {v7}, Ll/zjg;-><init>()V

    .line 6
    .line 7
    .line 8
    sget v9, Ll/qa00;->p:I

    .line 9
    .line 10
    int-to-float v1, v9

    .line 11
    const/4 v10, 0x2

    .line 12
    new-array v8, v10, [F

    .line 13
    .line 14
    const/4 v11, 0x0

    .line 15
    aput v1, v8, v11

    .line 16
    .line 17
    const/4 v12, 0x1

    .line 18
    const/4 v13, 0x0

    .line 19
    aput v13, v8, v12

    .line 20
    .line 21
    const-string v2, "translationY"

    .line 22
    .line 23
    const-wide/16 v3, 0x0

    .line 24
    .line 25
    const-wide/16 v5, 0x1f4

    .line 26
    .line 27
    move-object/from16 v1, p1

    .line 28
    .line 29
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object v14

    .line 33
    neg-int v1, v9

    .line 34
    int-to-float v1, v1

    .line 35
    new-array v8, v10, [F

    .line 36
    .line 37
    aput v13, v8, v11

    .line 38
    .line 39
    aput v1, v8, v12

    .line 40
    .line 41
    const-string v2, "translationY"

    .line 42
    .line 43
    move-object/from16 v1, p2

    .line 44
    .line 45
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    move-result-object v15

    .line 49
    neg-int v1, v9

    .line 50
    int-to-float v1, v1

    .line 51
    sget v2, Ll/qa00;->z:I

    .line 52
    .line 53
    neg-int v2, v2

    .line 54
    int-to-float v2, v2

    .line 55
    new-array v8, v10, [F

    .line 56
    .line 57
    aput v1, v8, v11

    .line 58
    .line 59
    aput v2, v8, v12

    .line 60
    .line 61
    const-string v2, "translationY"

    .line 62
    .line 63
    move-object/from16 v1, p3

    .line 64
    .line 65
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    move-result-object v16

    .line 69
    new-array v8, v10, [F

    .line 70
    .line 71
    fill-array-data v8, :array_0

    .line 72
    .line 73
    .line 74
    const-string v2, "alpha"

    .line 75
    .line 76
    move-object/from16 v1, p1

    .line 77
    .line 78
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    move-result-object v17

    .line 82
    new-array v8, v10, [F

    .line 83
    .line 84
    fill-array-data v8, :array_1

    .line 85
    .line 86
    .line 87
    const-string v2, "alpha"

    .line 88
    .line 89
    move-object/from16 v1, p2

    .line 90
    .line 91
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 92
    .line 93
    .line 94
    move-result-object v18

    .line 95
    new-array v8, v10, [F

    .line 96
    .line 97
    fill-array-data v8, :array_2

    .line 98
    .line 99
    .line 100
    const-string v2, "alpha"

    .line 101
    .line 102
    move-object/from16 v1, p3

    .line 103
    .line 104
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    move-result-object v19

    .line 108
    filled-new-array/range {v14 .. v19}, [Landroid/animation/Animator;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->all:Landroid/animation/Animator;

    .line 117
    .line 118
    new-instance v2, Ll/z6t;

    .line 119
    .line 120
    move-object/from16 v3, p1

    .line 121
    .line 122
    move-object/from16 v4, p2

    .line 123
    .line 124
    move-object/from16 v5, p3

    .line 125
    .line 126
    invoke-direct {v2, v3, v4, v5}, Ll/z6t;-><init>(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v1, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 130
    .line 131
    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->all:Landroid/animation/Animator;

    .line 133
    .line 134
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    nop

    .line 139
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3ecccccd    # 0.4f
    .end array-data

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :array_2
    .array-data 4
        0x3ecccccd    # 0.4f
        0x0
    .end array-data
.end method

.method public e(Ll/ner;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->view1:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->view2:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->view3:Landroid/view/View;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->subs:Ll/kcg0;

    .line 18
    .line 19
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->all:Landroid/animation/Animator;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 27
    .line 28
    .line 29
    :cond_0
    const-wide/16 v0, 0x3

    .line 30
    .line 31
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 32
    .line 33
    const-wide/16 v3, 0x0

    .line 34
    .line 35
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {p1, v0}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v0, Ll/y6t;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/y6t;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->subs:Ll/kcg0;

    .line 69
    .line 70
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->subs:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->view1:Landroid/view/View;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->view2:Landroid/view/View;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->view3:Landroid/view/View;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewRender:Ll/z20;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->all:Landroid/animation/Animator;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->f()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/jdc0;->T0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->view1:Landroid/view/View;

    .line 11
    .line 12
    sget v0, Ll/jdc0;->U0:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->view2:Landroid/view/View;

    .line 19
    .line 20
    sget v0, Ll/jdc0;->V0:I

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->view3:Landroid/view/View;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->view1:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->view2:Landroid/view/View;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewList:Ljava/util/ArrayList;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->view3:Landroid/view/View;

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public setViewRender(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Long;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->viewRender:Ll/z20;

    .line 2
    .line 3
    return-void
.end method
