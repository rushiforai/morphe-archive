.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mql;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/mql<",
        "Ll/t7m;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/t7m;

.field public b:Lcom/p1/mobile/putong/data/User;

.field public c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public d:Z

.field public e:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public f:Landroid/content/Context;

.field public g:Landroid/widget/FrameLayout;

.field public h:Z

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

.field public k:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ll/qk4;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/qk4;

.field public m:I

.field public n:I


# direct methods
.method public constructor <init>(ZLandroid/content/Context;Landroid/widget/FrameLayout;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->m:I

    .line 9
    .line 10
    const/4 v0, -0x1

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->n:I

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->h:Z

    .line 14
    .line 15
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->g:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->f:Landroid/content/Context;

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->i:Ljava/util/List;

    .line 25
    .line 26
    new-instance p1, Landroid/util/SparseArray;

    .line 27
    .line 28
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->k:Landroid/util/SparseArray;

    .line 32
    .line 33
    return-void
.end method

.method private E(Ll/qk4;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Rc()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 20
    .line 21
    iget-object p0, p0, Ll/qk4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 22
    .line 23
    iget-object v0, p1, Ll/qk4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 24
    .line 25
    if-eq p0, v0, :cond_0

    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->MOMENT:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 28
    .line 29
    if-ne v0, p0, :cond_0

    .line 30
    .line 31
    iget-object p0, p1, Ll/qk4;->b:Landroid/view/View;

    .line 32
    .line 33
    instance-of p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;

    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->l:Lv/VRelative;

    .line 46
    .line 47
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_0

    .line 52
    .line 53
    invoke-static {}, Ll/luh;->d()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {}, Ll/luh;->c()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string v0, "p_edit_profile_view"

    .line 62
    .line 63
    invoke-static {p0, p1, v0}, Ll/luh;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;Landroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->A(Landroid/view/View;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic l(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic m(Landroid/view/View;Ll/qk4;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 3
    .line 4
    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Ll/qk4;->b:Landroid/view/View;

    .line 11
    .line 12
    const/16 p1, 0x8

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic n(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 6
    .line 7
    .line 8
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic o()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;Ll/qk4;Ll/qk4;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->D(Ll/qk4;Ll/qk4;Z)V

    return-void
.end method

.method public static synthetic q(Landroid/view/View;Ll/qk4;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 3
    .line 4
    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Ll/qk4;->b:Landroid/view/View;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->C(Landroid/view/View;I)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->B(Landroid/view/View;I)V

    return-void
.end method

.method public static synthetic t(Ll/qk4;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qk4;->b:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private w(Ll/qk4;Ll/qk4;Z)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/qk4;->b:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/nj4;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2, p3}, Ll/nj4;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;Ll/qk4;Ll/qk4;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private x(Ll/qk4;Ll/qk4;Z)V
    .locals 11

    .line 1
    const/high16 p0, -0x40800000    # -1.0f

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    move p3, p0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move p3, v0

    .line 10
    :goto_0
    iget-object v1, p2, Ll/qk4;->b:Landroid/view/View;

    .line 11
    .line 12
    sget v2, Ll/adc0;->R0:I

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p1, Ll/qk4;->b:Landroid/view/View;

    .line 19
    .line 20
    sget v3, Ll/adc0;->R0:I

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v3, p2, Ll/qk4;->b:Landroid/view/View;

    .line 27
    .line 28
    sget v4, Ll/adc0;->n6:I

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    iget-object v4, p1, Ll/qk4;->b:Landroid/view/View;

    .line 35
    .line 36
    sget v5, Ll/adc0;->n6:I

    .line 37
    .line 38
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v3, v0}, Landroid/view/View;->setAlpha(F)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    new-instance v6, Ll/oj4;

    .line 50
    .line 51
    invoke-direct {v6}, Ll/oj4;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    mul-float v6, p3, v0

    .line 59
    .line 60
    sget v7, Ll/qa00;->K:I

    .line 61
    .line 62
    int-to-float v8, v7

    .line 63
    mul-float/2addr v6, v8

    .line 64
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    const/4 v6, 0x0

    .line 69
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    const-wide/16 v8, 0x64

    .line 74
    .line 75
    invoke-virtual {v5, v8, v9}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    new-instance v10, Ll/pj4;

    .line 80
    .line 81
    invoke-direct {v10, v3, p2}, Ll/pj4;-><init>(Landroid/view/View;Ll/qk4;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v5, v10}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-virtual {p2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 89
    .line 90
    .line 91
    mul-float/2addr p3, p0

    .line 92
    int-to-float p0, v7

    .line 93
    mul-float/2addr p3, p0

    .line 94
    invoke-virtual {v4, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v4, v6}, Landroid/view/View;->setAlpha(F)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v4}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    new-instance p2, Ll/qj4;

    .line 105
    .line 106
    invoke-direct {p2, p1}, Ll/qj4;-><init>(Ll/qk4;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p2}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0, v6}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0, v8, v9}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    new-instance p2, Ll/rj4;

    .line 126
    .line 127
    invoke-direct {p2, v4, p1}, Ll/rj4;-><init>(Landroid/view/View;Ll/qk4;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0, p2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 135
    .line 136
    .line 137
    invoke-static {v1}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-static {v2, p0, p1}, Ll/bnl0;->K0(Landroid/view/View;Ll/bnl0$g;Ll/bnl0$g;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    new-instance p1, Ll/sj4;

    .line 160
    .line 161
    invoke-direct {p1, v1, v2}, Ll/sj4;-><init>(Landroid/view/View;Landroid/view/View;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p0, v6}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-virtual {p0, v6}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-virtual {p0, v8, v9}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    new-instance p1, Ll/tj4;

    .line 189
    .line 190
    invoke-direct {p1, v2, v4, v1}, Ll/tj4;-><init>(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 198
    .line 199
    .line 200
    return-void
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    invoke-static {p1, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->f()Ll/t7m;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ll/sql;->J()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic B(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->f()Ll/t7m;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ll/sql;->J()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic C(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->f()Ll/t7m;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ll/sql;->J()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic D(Ll/qk4;Ll/qk4;Z)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/qk4;->b:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->x(Ll/qk4;Ll/qk4;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a(IZ)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->i:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x1

    .line 13
    sub-int/2addr v1, v2

    .line 14
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->e()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    :cond_0
    if-lez p1, :cond_1

    .line 35
    .line 36
    move p1, v0

    .line 37
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->i()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_3

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->d()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    move v5, p1

    .line 55
    goto :goto_1

    .line 56
    :cond_3
    :goto_0
    move v5, v0

    .line 57
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->i:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    move-object v6, p1

    .line 64
    check-cast v6, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_6

    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 75
    .line 76
    iget-object v1, p1, Ll/qk4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 77
    .line 78
    if-ne v1, v6, :cond_6

    .line 79
    .line 80
    invoke-virtual {p1}, Ll/qk4;->d()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 85
    .line 86
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->b()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_5

    .line 95
    .line 96
    sget-boolean p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 97
    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    iget-object p1, v6, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->explain:Ljava/lang/String;

    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 109
    .line 110
    const-string p1, "\u7f13\u5b58\u4e0d\u4e00\u81f4\u4e86"

    .line 111
    .line 112
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 116
    .line 117
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->f:Landroid/content/Context;

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->g:Landroid/widget/FrameLayout;

    .line 122
    .line 123
    invoke-virtual {p1, p2, v0, v1, v5}, Ll/qk4;->e(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/content/Context;Landroid/widget/FrameLayout;I)V

    .line 124
    .line 125
    .line 126
    :cond_5
    sget-boolean p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 127
    .line 128
    if-eqz p1, :cond_11

    .line 129
    .line 130
    iget-object p1, v6, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->explain:Ljava/lang/String;

    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 139
    .line 140
    return-void

    .line 141
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->k:Landroid/util/SparseArray;

    .line 142
    .line 143
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->getFrameId()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    check-cast p1, Ll/qk4;

    .line 152
    .line 153
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 154
    .line 155
    if-eqz v1, :cond_7

    .line 156
    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 158
    .line 159
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 164
    .line 165
    :cond_7
    if-nez p1, :cond_8

    .line 166
    .line 167
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 172
    .line 173
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->f:Landroid/content/Context;

    .line 174
    .line 175
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->g:Landroid/widget/FrameLayout;

    .line 176
    .line 177
    invoke-virtual/range {v3 .. v8}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;Landroid/widget/FrameLayout;)Ll/qk4;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->k:Landroid/util/SparseArray;

    .line 182
    .line 183
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->getFrameId()I

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    invoke-virtual {v1, v3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_8
    invoke-virtual {p1}, Ll/qk4;->d()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 196
    .line 197
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->b()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-nez v1, :cond_a

    .line 206
    .line 207
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 208
    .line 209
    if-eqz v1, :cond_9

    .line 210
    .line 211
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 212
    .line 213
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 218
    .line 219
    const-string v1, "\u7f13\u5b58\u4e0d\u4e00\u81f4\u4e86*"

    .line 220
    .line 221
    invoke-static {v1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 225
    .line 226
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->f:Landroid/content/Context;

    .line 227
    .line 228
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->g:Landroid/widget/FrameLayout;

    .line 229
    .line 230
    invoke-virtual {p1, v1, v3, v4, v5}, Ll/qk4;->e(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/content/Context;Landroid/widget/FrameLayout;I)V

    .line 231
    .line 232
    .line 233
    :cond_a
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 234
    .line 235
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 239
    .line 240
    if-eqz v1, :cond_c

    .line 241
    .line 242
    if-eqz p2, :cond_c

    .line 243
    .line 244
    iget-object v1, p1, Ll/qk4;->b:Landroid/view/View;

    .line 245
    .line 246
    const/4 v3, 0x4

    .line 247
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 248
    .line 249
    .line 250
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 251
    .line 252
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->m:I

    .line 253
    .line 254
    if-le v5, v3, :cond_b

    .line 255
    .line 256
    move v0, v2

    .line 257
    :cond_b
    invoke-direct {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->w(Ll/qk4;Ll/qk4;Z)V

    .line 258
    .line 259
    .line 260
    goto :goto_3

    .line 261
    :cond_c
    if-eqz v1, :cond_d

    .line 262
    .line 263
    iget-object v1, v1, Ll/qk4;->b:Landroid/view/View;

    .line 264
    .line 265
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 266
    .line 267
    .line 268
    iget-object v0, p1, Ll/qk4;->b:Landroid/view/View;

    .line 269
    .line 270
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 271
    .line 272
    .line 273
    goto :goto_3

    .line 274
    :cond_d
    iget-object v1, p1, Ll/qk4;->b:Landroid/view/View;

    .line 275
    .line 276
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 277
    .line 278
    .line 279
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 280
    .line 281
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-eqz v0, :cond_e

    .line 286
    .line 287
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 288
    .line 289
    if-eq v0, p1, :cond_e

    .line 290
    .line 291
    iget-object v0, v0, Ll/qk4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 292
    .line 293
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->INTL_COMPLIMENT_RECEIVED:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 294
    .line 295
    if-ne v0, v1, :cond_e

    .line 296
    .line 297
    const-string v0, "swipe"

    .line 298
    .line 299
    invoke-static {v0}, Ll/gp5;->d(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    :cond_e
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    move-result v0

    .line 306
    if-eqz v0, :cond_f

    .line 307
    .line 308
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->d:Z

    .line 309
    .line 310
    if-eqz v0, :cond_f

    .line 311
    .line 312
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->E(Ll/qk4;)V

    .line 313
    .line 314
    .line 315
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->h:Z

    .line 316
    .line 317
    if-nez v0, :cond_f

    .line 318
    .line 319
    iget-object v0, p1, Ll/qk4;->c:Ll/em2;

    .line 320
    .line 321
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 322
    .line 323
    invoke-virtual {v0, v1, p1, v5}, Ll/em2;->j(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Ll/qk4;I)V

    .line 324
    .line 325
    .line 326
    :cond_f
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 327
    .line 328
    iput v5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->m:I

    .line 329
    .line 330
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 331
    .line 332
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 337
    .line 338
    .line 339
    move-result v0

    .line 340
    if-nez v0, :cond_10

    .line 341
    .line 342
    invoke-static {}, Ll/d79;->m0()Z

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    if-nez v0, :cond_10

    .line 347
    .line 348
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->v(Z)V

    .line 349
    .line 350
    .line 351
    :cond_10
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 352
    .line 353
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->f()Ll/t7m;

    .line 354
    .line 355
    .line 356
    move-result-object p2

    .line 357
    invoke-interface {p2}, Ll/sql;->J()Landroid/view/View;

    .line 358
    .line 359
    .line 360
    move-result-object p2

    .line 361
    invoke-static {p2}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 362
    .line 363
    .line 364
    if-nez v5, :cond_11

    .line 365
    .line 366
    iget-object p1, p1, Ll/qk4;->b:Landroid/view/View;

    .line 367
    .line 368
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 369
    .line 370
    .line 371
    move-result p1

    .line 372
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->n:I

    .line 373
    .line 374
    :cond_11
    return-void
.end method

.method public b()V
    .locals 5

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->k:Landroid/util/SparseArray;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->k:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->k:Landroid/util/SparseArray;

    .line 18
    .line 19
    if-ge v1, v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ll/qk4;

    .line 30
    .line 31
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->f:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {v3, v4, v2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->f(Landroid/content/Context;Ll/qk4;)V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->g:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    iget-object v4, v2, Ll/qk4;->b:Landroid/view/View;

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    sget-boolean v3, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 54
    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    iget-object v2, v2, Ll/qk4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->explain:Ljava/lang/String;

    .line 60
    .line 61
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    .line 65
    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 69
    .line 70
    sget-boolean p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 71
    .line 72
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/qk4;->b:Landroid/view/View;

    .line 6
    .line 7
    instance-of v0, p0, Ll/pql;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast p0, Ll/pql;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/pql;->getUserContentLayout()Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->a0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public bridge synthetic e(Ll/q7m;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    check-cast p1, Ll/t7m;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->z(Ll/t7m;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, v0, Ll/qk4;->b:Landroid/view/View;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->a:Ll/t7m;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/sql;->l()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 6

    .line 1
    invoke-static {}, Ll/gra;->h3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 8
    .line 9
    iget-object v0, v0, Ll/qk4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->TAG:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 12
    .line 13
    if-ne v0, v1, :cond_3

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 16
    .line 17
    if-eqz p0, :cond_3

    .line 18
    .line 19
    const-string v4, "music"

    .line 20
    .line 21
    const-string v5, "food"

    .line 22
    .line 23
    const-string v0, "sports"

    .line 24
    .line 25
    const-string v1, "places"

    .line 26
    .line 27
    const-string v2, "movies"

    .line 28
    .line 29
    const-string v3, "literature"

    .line 30
    .line 31
    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->e:Ljava/util/Map;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    :goto_0
    const/4 v3, 0x6

    .line 48
    if-ge v2, v3, :cond_1

    .line 49
    .line 50
    aget-object v3, v0, v2

    .line 51
    .line 52
    invoke-interface {p0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-nez v4, :cond_0

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v3, "\u3001"

    .line 68
    .line 69
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-lez p0, :cond_2

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    add-int/lit8 p0, p0, -0x1

    .line 86
    .line 87
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0

    .line 95
    :cond_3
    const-string p0, ""

    .line 96
    .line 97
    return-object p0
.end method

.method public bridge synthetic h(Ll/q7m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/t7m;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->u(Ll/t7m;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/qk4;->b:Landroid/view/View;

    .line 7
    .line 8
    instance-of v1, p0, Ll/pql;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    check-cast p0, Ll/pql;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/pql;->getUserContentLayout()Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->g:Lv/VText;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->g:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_0

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_0
    return v0
.end method

.method public j(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->a(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public u(Ll/t7m;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final v(Z)V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->f()Ll/t7m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->f()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->f()Ll/t7m;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ll/t7m;->V()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->l:Ll/qk4;

    .line 35
    .line 36
    iget-object v2, v2, Ll/qk4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 37
    .line 38
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->y(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_3

    .line 47
    .line 48
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 49
    .line 50
    if-eq v1, v2, :cond_3

    .line 51
    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    filled-new-array {v1, v2}, [I

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-wide/16 v3, 0x64

    .line 63
    .line 64
    invoke-virtual {p1, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance v1, Ll/kj4;

    .line 69
    .line 70
    invoke-direct {v1, p0, v0}, Ll/kj4;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 74
    .line 75
    .line 76
    new-instance v1, Ll/lj4;

    .line 77
    .line 78
    invoke-direct {v1, p0, v0, v2}, Ll/lj4;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;Landroid/view/View;I)V

    .line 79
    .line 80
    .line 81
    new-instance v3, Ll/mj4;

    .line 82
    .line 83
    invoke-direct {v3, p0, v0, v2}, Ll/mj4;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;Landroid/view/View;I)V

    .line 84
    .line 85
    .line 86
    invoke-static {p1, v1, v3}, Ll/gt0;->g(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {v0, p0}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->f()Ll/t7m;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-interface {p0}, Ll/sql;->J()Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 112
    .line 113
    .line 114
    :cond_3
    :goto_0
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->a(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/high16 p0, 0x42c80000    # 100.0f

    .line 11
    .line 12
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public z(Ll/t7m;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->a:Ll/t7m;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->b:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->d:Z

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->e:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->h()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 20
    .line 21
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 25
    .line 26
    invoke-interface {p1}, Ll/t7m;->d()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->o(Z)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 34
    .line 35
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->h:Z

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->q(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 41
    .line 42
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->t(Lcom/p1/mobile/putong/data/User;)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 46
    .line 47
    invoke-interface {p1}, Ll/t7m;->g()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->r(Z)V

    .line 52
    .line 53
    .line 54
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 55
    .line 56
    invoke-virtual {p2, p5}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->p(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 57
    .line 58
    .line 59
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 60
    .line 61
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->u(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 62
    .line 63
    .line 64
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 65
    .line 66
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->s(Z)V

    .line 67
    .line 68
    .line 69
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 70
    .line 71
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->m(Ll/t7m;)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->i:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 77
    .line 78
    .line 79
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    const/4 p2, 0x0

    .line 84
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 85
    .line 86
    .line 87
    move-result p3

    .line 88
    if-eqz p3, :cond_2

    .line 89
    .line 90
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p3

    .line 94
    check-cast p3, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 95
    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 97
    .line 98
    .line 99
    move-result-object p4

    .line 100
    invoke-virtual {p4, p3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->l(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;)Ll/em2;

    .line 101
    .line 102
    .line 103
    move-result-object p4

    .line 104
    iget-object p5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->f:Landroid/content/Context;

    .line 107
    .line 108
    invoke-interface {p4, p5, p2, p3, v0}, Ll/qql;->a(Ll/oql;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z

    .line 109
    .line 110
    .line 111
    move-result p5

    .line 112
    if-eqz p5, :cond_0

    .line 113
    .line 114
    iget-object p5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 115
    .line 116
    iget-object p5, p5, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 117
    .line 118
    iget-object p5, p5, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 119
    .line 120
    if-nez p5, :cond_1

    .line 121
    .line 122
    invoke-virtual {p4}, Ll/em2;->i()Z

    .line 123
    .line 124
    .line 125
    move-result p4

    .line 126
    if-eqz p4, :cond_1

    .line 127
    .line 128
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 129
    .line 130
    iget-object p4, p4, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 131
    .line 132
    iput-object p3, p4, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 133
    .line 134
    :cond_1
    add-int/lit8 p2, p2, 0x1

    .line 135
    .line 136
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->i:Ljava/util/List;

    .line 137
    .line 138
    invoke-interface {p4, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_2
    return-void
.end method
