.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;,
        Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public b:Lv/VLinear;

.field public c:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealNumContentLayout;

.field public e:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public f:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public h:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;",
            ">;>;"
        }
    .end annotation
.end field

.field public k:Landroid/animation/ValueAnimator;

.field public l:F


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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->i:Ljava/util/List;

    .line 10
    .line 11
    const/high16 p1, 0x41200000    # 10.0f

    .line 12
    .line 13
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    int-to-float p1, p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->l:F

    .line 19
    .line 20
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

    .line 21
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->i:Ljava/util/List;

    const/high16 p1, 0x41200000    # 10.0f

    .line 23
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->l:F

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

    .line 24
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->i:Ljava/util/List;

    const/high16 p1, 0x41200000    # 10.0f

    .line 26
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->l:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 28
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->i:Ljava/util/List;

    const/high16 p1, 0x41200000    # 10.0f

    .line 29
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->l:F

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->g(Ll/pf60;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->h(F)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ctq;->a(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->k:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->k:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p1, 0x2

    .line 17
    new-array p1, p1, [F

    .line 18
    .line 19
    fill-array-data p1, :array_0

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->k:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    const-wide/16 v0, 0x1f4

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->k:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$a;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->k:Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final e(Ll/pf60;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->j:Ljava/util/HashMap;

    .line 7
    .line 8
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->a()Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-object v0
.end method

.method public final f()V
    .locals 7

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->j:Ljava/util/HashMap;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 14
    .line 15
    const/high16 v2, 0x3f800000    # 1.0f

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x1

    .line 19
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    invoke-direct {v1, v3, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 35
    .line 36
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->j:Ljava/util/HashMap;

    .line 43
    .line 44
    sget-object v6, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 45
    .line 46
    invoke-virtual {v1, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    new-instance v0, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 55
    .line 56
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 57
    .line 58
    .line 59
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 63
    .line 64
    invoke-direct {v1, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 65
    .line 66
    .line 67
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 71
    .line 72
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 73
    .line 74
    .line 75
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->j:Ljava/util/HashMap;

    .line 79
    .line 80
    sget-object v6, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->PRE_START:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 81
    .line 82
    invoke-virtual {v1, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    new-instance v0, Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .line 89
    .line 90
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 91
    .line 92
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 93
    .line 94
    .line 95
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 99
    .line 100
    invoke-direct {v1, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 101
    .line 102
    .line 103
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 107
    .line 108
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 109
    .line 110
    .line 111
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->j:Ljava/util/HashMap;

    .line 115
    .line 116
    sget-object v6, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->TRIALING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 117
    .line 118
    invoke-virtual {v1, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    new-instance v0, Ljava/util/ArrayList;

    .line 122
    .line 123
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 124
    .line 125
    .line 126
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 127
    .line 128
    invoke-direct {v1, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 129
    .line 130
    .line 131
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 135
    .line 136
    invoke-direct {v1, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 137
    .line 138
    .line 139
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 143
    .line 144
    invoke-direct {v1, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 145
    .line 146
    .line 147
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->j:Ljava/util/HashMap;

    .line 151
    .line 152
    sget-object v6, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 153
    .line 154
    invoke-virtual {v1, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->j:Ljava/util/HashMap;

    .line 158
    .line 159
    sget-object v6, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 160
    .line 161
    invoke-virtual {v1, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    new-instance v0, Ljava/util/ArrayList;

    .line 165
    .line 166
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 167
    .line 168
    .line 169
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 170
    .line 171
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 172
    .line 173
    .line 174
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 178
    .line 179
    invoke-direct {v1, v3, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 180
    .line 181
    .line 182
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 186
    .line 187
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;-><init>(FFZ)V

    .line 188
    .line 189
    .line 190
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->j:Ljava/util/HashMap;

    .line 194
    .line 195
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->FINISH:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 196
    .line 197
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public final synthetic g(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->j(Ll/pf60;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h(F)V
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 20
    .line 21
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 22
    .line 23
    iget v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->a:F

    .line 24
    .line 25
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 26
    .line 27
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->a:F

    .line 28
    .line 29
    sub-float/2addr v5, v3

    .line 30
    mul-float/2addr v5, p1

    .line 31
    add-float/2addr v3, v5

    .line 32
    iput v3, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->a:F

    .line 33
    .line 34
    iget v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b:F

    .line 35
    .line 36
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b:F

    .line 37
    .line 38
    sub-float/2addr v5, v3

    .line 39
    mul-float/2addr v5, p1

    .line 40
    add-float/2addr v3, v5

    .line 41
    iput v3, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b:F

    .line 42
    .line 43
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->d:F

    .line 44
    .line 45
    iget v3, v4, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->d:F

    .line 46
    .line 47
    sub-float/2addr v3, v2

    .line 48
    mul-float/2addr v3, p1

    .line 49
    add-float/2addr v2, v3

    .line 50
    iput v2, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->d:F

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->a()V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    return-void
.end method

.method public i(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->k3()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 10
    .line 11
    iget-object v2, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->e:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 21
    .line 22
    iget-object v2, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 23
    .line 24
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->j(Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->m3()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v1, 0x1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v0, Ll/btq;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/btq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final j(Ll/pf60;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->e:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->e:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 13
    .line 14
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 24
    .line 25
    invoke-static {}, Ll/bnl0;->y0()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/high16 v2, -0x80000000

    .line 30
    .line 31
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/high16 v3, 0x41f00000    # 30.0f

    .line 36
    .line 37
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    invoke-static {v4, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-virtual {v0, v1, v4}, Landroid/view/View;->measure(II)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->e:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 49
    .line 50
    invoke-static {}, Ll/bnl0;->y0()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->measure(II)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->e(Ll/pf60;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const/4 v1, 0x0

    .line 74
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->i:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-ge v1, v2, :cond_7

    .line 81
    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->i:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;

    .line 89
    .line 90
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 95
    .line 96
    iget-object v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 97
    .line 98
    invoke-virtual {v4, v3}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;)V

    .line 99
    .line 100
    .line 101
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->h:Ll/pf60;

    .line 102
    .line 103
    if-nez v3, :cond_0

    .line 104
    .line 105
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 106
    .line 107
    iget-object v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 108
    .line 109
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->a()V

    .line 113
    .line 114
    .line 115
    goto/16 :goto_1

    .line 116
    .line 117
    :cond_0
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 118
    .line 119
    iget-object v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 120
    .line 121
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;)V

    .line 122
    .line 123
    .line 124
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 125
    .line 126
    iget-object v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 127
    .line 128
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;)V

    .line 129
    .line 130
    .line 131
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 132
    .line 133
    const/4 v4, 0x0

    .line 134
    iput v4, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->d:F

    .line 135
    .line 136
    iget-object v5, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 137
    .line 138
    iget-boolean v6, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->c:Z

    .line 139
    .line 140
    iget-object v7, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 141
    .line 142
    iget-boolean v7, v7, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->c:Z

    .line 143
    .line 144
    if-eq v6, v7, :cond_1

    .line 145
    .line 146
    iget-object v6, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 147
    .line 148
    iget-boolean v6, v6, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->c:Z

    .line 149
    .line 150
    iput-boolean v6, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->c:Z

    .line 151
    .line 152
    :cond_1
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->a:Landroid/view/View;

    .line 153
    .line 154
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->e:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 155
    .line 156
    const/high16 v7, 0x3f800000    # 1.0f

    .line 157
    .line 158
    if-ne v3, v6, :cond_3

    .line 159
    .line 160
    invoke-virtual {v6}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 165
    .line 166
    invoke-virtual {v5}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    iget-object v5, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 175
    .line 176
    if-eqz v3, :cond_2

    .line 177
    .line 178
    iput v4, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b:F

    .line 179
    .line 180
    iput v7, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->a:F

    .line 181
    .line 182
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 183
    .line 184
    iput v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b:F

    .line 185
    .line 186
    iput v7, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->a:F

    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_2
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->l:F

    .line 190
    .line 191
    iput v3, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b:F

    .line 192
    .line 193
    iput v4, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->a:F

    .line 194
    .line 195
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 196
    .line 197
    iput v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b:F

    .line 198
    .line 199
    iput v7, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->a:F

    .line 200
    .line 201
    goto :goto_1

    .line 202
    :cond_3
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 203
    .line 204
    if-ne v3, v8, :cond_5

    .line 205
    .line 206
    invoke-virtual {v6}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 211
    .line 212
    invoke-virtual {v5}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 213
    .line 214
    .line 215
    move-result-object v5

    .line 216
    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 217
    .line 218
    .line 219
    move-result v3

    .line 220
    iget-object v5, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 221
    .line 222
    if-eqz v3, :cond_4

    .line 223
    .line 224
    iput v4, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b:F

    .line 225
    .line 226
    iput v4, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->a:F

    .line 227
    .line 228
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 229
    .line 230
    iput v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b:F

    .line 231
    .line 232
    iput v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->a:F

    .line 233
    .line 234
    goto :goto_1

    .line 235
    :cond_4
    iput v4, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b:F

    .line 236
    .line 237
    iput v7, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->a:F

    .line 238
    .line 239
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 240
    .line 241
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->l:F

    .line 242
    .line 243
    neg-float v3, v3

    .line 244
    iput v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->b:F

    .line 245
    .line 246
    iput v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->a:F

    .line 247
    .line 248
    goto :goto_1

    .line 249
    :cond_5
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->g:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 250
    .line 251
    if-ne v3, v6, :cond_6

    .line 252
    .line 253
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    .line 254
    .line 255
    .line 256
    move-result v3

    .line 257
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->e:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 258
    .line 259
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    .line 260
    .line 261
    .line 262
    move-result v6

    .line 263
    sub-int/2addr v3, v6

    .line 264
    int-to-float v3, v3

    .line 265
    iput v3, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->d:F

    .line 266
    .line 267
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;

    .line 268
    .line 269
    iput v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$b;->d:F

    .line 270
    .line 271
    :cond_6
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 272
    .line 273
    goto/16 :goto_0

    .line 274
    .line 275
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->h:Ll/pf60;

    .line 276
    .line 277
    if-eqz v0, :cond_8

    .line 278
    .line 279
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 280
    .line 281
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 282
    .line 283
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->d(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 284
    .line 285
    .line 286
    :cond_8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->h:Ll/pf60;

    .line 287
    .line 288
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Landroid/animation/LayoutTransition;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 10
    .line 11
    .line 12
    const-wide/16 v1, 0x1f4

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/animation/LayoutTransition;->setDuration(J)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->b:Lv/VLinear;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->i:Ljava/util/List;

    .line 23
    .line 24
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->e:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 27
    .line 28
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;-><init>(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->i:Ljava/util/List;

    .line 35
    .line 36
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 39
    .line 40
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;-><init>(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->i:Ljava/util/List;

    .line 47
    .line 48
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->g:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 51
    .line 52
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout$c;-><init>(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->f()V

    .line 59
    .line 60
    .line 61
    return-void
.end method
