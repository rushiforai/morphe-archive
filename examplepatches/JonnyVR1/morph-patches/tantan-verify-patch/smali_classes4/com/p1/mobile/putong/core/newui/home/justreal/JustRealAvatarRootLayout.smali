.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:[I

.field public c:Landroid/view/animation/PathInterpolator;

.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public e:I

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const p1, -0xffff01

    .line 5
    .line 6
    .line 7
    const/16 v0, -0x100

    .line 8
    .line 9
    const/high16 v1, -0x10000

    .line 10
    .line 11
    const v2, -0xff0100

    .line 12
    .line 13
    .line 14
    filled-new-array {v1, v2, p1, v0}, [I

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->b:[I

    .line 19
    .line 20
    const/high16 p1, 0x41e00000    # 28.0f

    .line 21
    .line 22
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->e:I

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->d()V

    .line 29
    .line 30
    .line 31
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

    .line 32
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p1, -0xffff01

    const/16 p2, -0x100

    const/high16 v0, -0x10000

    const v1, -0xff0100

    .line 33
    filled-new-array {v0, v1, p1, p2}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->b:[I

    const/high16 p1, 0x41e00000    # 28.0f

    .line 34
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->e:I

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->d()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p1, -0xffff01

    const/16 p2, -0x100

    const/high16 p3, -0x10000

    const v0, -0xff0100

    .line 37
    filled-new-array {p3, v0, p1, p2}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->b:[I

    const/high16 p1, 0x41e00000    # 28.0f

    .line 38
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->e:I

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->d()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->e(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->f(Ll/uxj0;)V

    return-void
.end method


# virtual methods
.method public final c(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;

    .line 18
    .line 19
    iget v2, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 20
    .line 21
    if-gez v2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 v1, 0x0

    .line 25
    :goto_0
    if-nez v1, :cond_2

    .line 26
    .line 27
    return-void

    .line 28
    :cond_2
    const/4 v0, 0x0

    .line 29
    iput v0, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->b()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->c()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/lit8 v0, v0, -0x1

    .line 44
    .line 45
    iput v0, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->f:I

    .line 46
    .line 47
    iget-object v0, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;->b(Lcom/p1/mobile/putong/data/User;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->f:Ll/y20;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->f:Ll/y20;

    .line 61
    .line 62
    invoke-interface {v0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    :cond_4
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_5

    .line 76
    .line 77
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;

    .line 82
    .line 83
    if-eq v0, v1, :cond_4

    .line 84
    .line 85
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 86
    .line 87
    if-ltz v2, :cond_4

    .line 88
    .line 89
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->f:I

    .line 96
    .line 97
    add-int/2addr v2, v3

    .line 98
    add-int/lit8 v2, v2, -0x1

    .line 99
    .line 100
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    rem-int/2addr v2, v3

    .line 107
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->f:I

    .line 108
    .line 109
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 110
    .line 111
    add-int/lit8 v2, v2, 0x1

    .line 112
    .line 113
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 114
    .line 115
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->c()V

    .line 116
    .line 117
    .line 118
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 119
    .line 120
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    add-int/lit8 v3, v3, -0x1

    .line 127
    .line 128
    if-ne v2, v3, :cond_4

    .line 129
    .line 130
    const/4 v2, 0x0

    .line 131
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->j:F

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_5
    if-nez p2, :cond_6

    .line 135
    .line 136
    const/high16 p0, 0x3f800000    # 1.0f

    .line 137
    .line 138
    invoke-virtual {v1, p0, p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->d(FF)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->h()V

    .line 143
    .line 144
    .line 145
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public final d()V
    .locals 7

    .line 1
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const v1, 0x3f2147ae    # 0.63f

    .line 4
    .line 5
    .line 6
    const v2, 0x3fa7ae14    # 1.31f

    .line 7
    .line 8
    .line 9
    const v3, 0x3f4ccccd    # 0.8f

    .line 10
    .line 11
    .line 12
    const v4, 0x3f051eb8    # 0.52f

    .line 13
    .line 14
    .line 15
    invoke-direct {v0, v3, v4, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->c:Landroid/view/animation/PathInterpolator;

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    move v1, v0

    .line 29
    :goto_0
    const/4 v2, 0x4

    .line 30
    if-ge v1, v2, :cond_0

    .line 31
    .line 32
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-direct {v2, v3}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    rsub-int/lit8 v3, v1, 0x3

    .line 42
    .line 43
    iput v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->f:I

    .line 44
    .line 45
    const/4 v3, -0x1

    .line 46
    iput v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    iput v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->h:F

    .line 50
    .line 51
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    iget-object v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

    .line 57
    .line 58
    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    .line 59
    .line 60
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->e:I

    .line 61
    .line 62
    invoke-direct {v5, v6, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    .line 67
    .line 68
    iget-object v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

    .line 69
    .line 70
    invoke-virtual {v4, v3}, Landroid/view/View;->setElevation(F)V

    .line 71
    .line 72
    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

    .line 74
    .line 75
    const/high16 v3, 0x3f800000    # 1.0f

    .line 76
    .line 77
    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 78
    .line 79
    .line 80
    add-int/lit8 v1, v1, 0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    const/4 v1, 0x0

    .line 84
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 85
    .line 86
    .line 87
    const/4 v0, 0x1

    .line 88
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setChildrenDrawingOrderEnabled(Z)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public doFrame(J)V
    .locals 10

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, 0x1

    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;

    .line 24
    .line 25
    iget v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 26
    .line 27
    if-ltz v4, :cond_0

    .line 28
    .line 29
    iget-wide v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->k:J

    .line 30
    .line 31
    cmp-long v4, p1, v4

    .line 32
    .line 33
    if-ltz v4, :cond_0

    .line 34
    .line 35
    iget-wide v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->l:J

    .line 36
    .line 37
    invoke-static {v4, v5, p1, p2}, Ljava/lang/Math;->min(JJ)J

    .line 38
    .line 39
    .line 40
    move-result-wide v4

    .line 41
    iget-wide v6, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->k:J

    .line 42
    .line 43
    sub-long/2addr v4, v6

    .line 44
    long-to-float v4, v4

    .line 45
    iget-wide v8, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->l:J

    .line 46
    .line 47
    sub-long/2addr v8, v6

    .line 48
    long-to-float v5, v8

    .line 49
    div-float/2addr v4, v5

    .line 50
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->c:Landroid/view/animation/PathInterpolator;

    .line 51
    .line 52
    invoke-virtual {v5, v4}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    invoke-virtual {v2, v5, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->d(FF)V

    .line 57
    .line 58
    .line 59
    iget-wide v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->l:J

    .line 60
    .line 61
    cmp-long v2, p1, v4

    .line 62
    .line 63
    if-gez v2, :cond_0

    .line 64
    .line 65
    move v1, v3

    .line 66
    goto :goto_0

    .line 67
    :cond_1
    if-eqz v1, :cond_2

    .line 68
    .line 69
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_4

    .line 87
    .line 88
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;

    .line 93
    .line 94
    iget v2, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 95
    .line 96
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    sub-int/2addr v4, v3

    .line 103
    if-ne v2, v4, :cond_3

    .line 104
    .line 105
    iget-wide v4, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->l:J

    .line 106
    .line 107
    cmp-long v2, p1, v4

    .line 108
    .line 109
    if-ltz v2, :cond_3

    .line 110
    .line 111
    const/4 v2, -0x1

    .line 112
    iput v2, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 113
    .line 114
    const/4 v2, 0x0

    .line 115
    iput v2, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->h:F

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->h()V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->c(Lcom/p1/mobile/putong/data/User;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic f(Ll/uxj0;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-ge p1, v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;

    .line 25
    .line 26
    rsub-int/lit8 v1, p1, 0x3

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->f:I

    .line 29
    .line 30
    const/4 v1, -0x1

    .line 31
    iput v1, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    iput v1, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->h:F

    .line 35
    .line 36
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

    .line 37
    .line 38
    invoke-virtual {v2, v1}, Landroid/view/View;->setElevation(F)V

    .line 39
    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 44
    .line 45
    .line 46
    add-int/lit8 p1, p1, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    return-void
.end method

.method public g(Lcom/p1/mobile/android/app/Act;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->u3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/zsq;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/zsq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->U:Lrx/subjects/b;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v0, Ll/atq;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/atq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    new-instance p1, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->l3()Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_1

    .line 65
    .line 66
    const/4 v1, 0x3

    .line 67
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    const/4 v2, 0x0

    .line 76
    move v3, v2

    .line 77
    :goto_0
    const/4 v4, 0x1

    .line 78
    if-ge v3, v1, :cond_0

    .line 79
    .line 80
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    sub-int/2addr v5, v4

    .line 85
    sub-int/2addr v5, v3

    .line 86
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    check-cast v4, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;

    .line 91
    .line 92
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 93
    .line 94
    invoke-interface {p1, v2, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    add-int/lit8 v3, v3, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_1

    .line 109
    .line 110
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 115
    .line 116
    invoke-virtual {p0, v0, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->c(Lcom/p1/mobile/putong/data/User;Z)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_1
    return-void
.end method

.method public getChildDrawingOrder(II)I
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;

    .line 8
    .line 9
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->f:I

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 19
    .line 20
    if-ge p1, v0, :cond_1

    .line 21
    .line 22
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;

    .line 27
    .line 28
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->f:I

    .line 29
    .line 30
    if-ne v0, p2, :cond_0

    .line 31
    .line 32
    return p1

    .line 33
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;

    .line 41
    .line 42
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->f:I

    .line 43
    .line 44
    return p0
.end method

.method public final h()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-eqz v3, :cond_3

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;

    .line 20
    .line 21
    iget v4, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 22
    .line 23
    iget-object v5, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

    .line 24
    .line 25
    if-ltz v4, :cond_2

    .line 26
    .line 27
    iget v4, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->h:F

    .line 28
    .line 29
    invoke-virtual {v5, v4}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    iget-object v4, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

    .line 33
    .line 34
    iget v5, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->b:F

    .line 35
    .line 36
    invoke-virtual {v4, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 37
    .line 38
    .line 39
    iget v4, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 40
    .line 41
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    add-int/lit8 v5, v5, -0x1

    .line 48
    .line 49
    if-ge v4, v5, :cond_1

    .line 50
    .line 51
    iget v4, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->c:F

    .line 52
    .line 53
    invoke-static {v4, v2}, Ljava/lang/Math;->max(FF)F

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    :cond_1
    iget v4, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 58
    .line 59
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    add-int/lit8 v5, v5, -0x1

    .line 66
    .line 67
    if-ne v4, v5, :cond_0

    .line 68
    .line 69
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->d:F

    .line 70
    .line 71
    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    goto :goto_0

    .line 76
    :cond_2
    invoke-virtual {v5, v1}, Landroid/view/View;->setAlpha(F)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->d:Ll/y20;

    .line 87
    .line 88
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->d:Ll/y20;

    .line 95
    .line 96
    float-to-int v0, v2

    .line 97
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    :cond_4
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p2, 0x0

    .line 8
    move p3, p2

    .line 9
    :goto_0
    if-ge p3, p1, :cond_0

    .line 10
    .line 11
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    check-cast p4, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;

    .line 18
    .line 19
    iget-object p4, p4, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

    .line 20
    .line 21
    iget p5, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->e:I

    .line 22
    .line 23
    invoke-virtual {p4, p2, p2, p5, p5}, Landroid/view/View;->layout(IIII)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 p3, p3, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/4 p2, 0x0

    .line 11
    :goto_0
    if-ge p2, p1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

    .line 22
    .line 23
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->e:I

    .line 24
    .line 25
    const/high16 v2, 0x40000000    # 2.0f

    .line 26
    .line 27
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->e:I

    .line 32
    .line 33
    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->measure(II)V

    .line 38
    .line 39
    .line 40
    add-int/lit8 p2, p2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    return-void
.end method

.method public setRenderUserCall(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->f:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setTitleTransCall(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->d:Ll/y20;

    .line 2
    .line 3
    return-void
.end method
