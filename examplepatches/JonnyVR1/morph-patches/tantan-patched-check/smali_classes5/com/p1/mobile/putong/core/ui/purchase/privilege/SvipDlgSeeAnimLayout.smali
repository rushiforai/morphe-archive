.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# static fields
.field public static m:J = 0x226L


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Z

.field public k:Z

.field public l:Landroid/animation/AnimatorSet;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->k:Z

    .line 8
    .line 9
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

    .line 10
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j:Z

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->k:Z

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

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j:Z

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->k:Z

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->k0([I)V

    return-void
.end method

.method private j0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;
    .locals 3

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    const/high16 p4, -0x3e100000    # -30.0f

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/high16 p4, 0x41f00000    # 30.0f

    .line 7
    .line 8
    :goto_0
    const/4 v0, 0x2

    .line 9
    new-array v1, v0, [F

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    aput p4, v1, v2

    .line 13
    .line 14
    const/4 p4, 0x1

    .line 15
    const/4 v2, 0x0

    .line 16
    aput v2, v1, p4

    .line 17
    .line 18
    const-string p4, "rotation"

    .line 19
    .line 20
    invoke-static {p4, v1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    new-array v0, v0, [F

    .line 25
    .line 26
    fill-array-data v0, :array_0

    .line 27
    .line 28
    .line 29
    const-string v1, "alpha"

    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    filled-new-array {p4, v0}, [Landroid/animation/PropertyValuesHolder;

    .line 36
    .line 37
    .line 38
    move-result-object p4

    .line 39
    invoke-static {p1, p4}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object p4

    .line 43
    const-wide/16 v0, 0x15e

    .line 44
    .line 45
    invoke-virtual {p4, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 46
    .line 47
    .line 48
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 49
    .line 50
    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p4, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p4, p2, p3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 57
    .line 58
    .line 59
    new-instance p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout$a;

    .line 60
    .line 61
    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p4, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 65
    .line 66
    .line 67
    return-object p4

    .line 68
    nop

    .line 69
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public d(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->e:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/4 v3, 0x2

    .line 18
    const/16 v4, 0x64

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->g:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->p7:I

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->n7:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->l7:I

    .line 57
    .line 58
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 59
    .line 60
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    const/16 v5, 0x1e

    .line 65
    .line 66
    if-le v4, v5, :cond_1

    .line 67
    .line 68
    const-string v4, "30+"

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 72
    .line 73
    :goto_1
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const-string v2, "%s %s"

    .line 86
    .line 87
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->h:Lv/VText;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->o7:I

    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 111
    .line 112
    iget v4, v4, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 113
    .line 114
    invoke-interface {v3, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Rl(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 130
    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 132
    .line 133
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_2

    .line 138
    .line 139
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 140
    .line 141
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 142
    .line 143
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_2

    .line 150
    .line 151
    const/4 v0, 0x1

    .line 152
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j:Z

    .line 153
    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->i:Lv/VText;

    .line 155
    .line 156
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 157
    .line 158
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 159
    .line 160
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_2
    const/4 p1, 0x0

    .line 167
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j:Z

    .line 168
    .line 169
    return-void
.end method

.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/geh0;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k0([I)V
    .locals 12

    .line 1
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->l:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->f:Lv/VText;

    .line 11
    .line 12
    const/4 v2, 0x3

    .line 13
    const/4 v3, 0x2

    .line 14
    const-wide/16 v4, 0x2

    .line 15
    .line 16
    const-wide/16 v6, 0x0

    .line 17
    .line 18
    const/4 v8, 0x0

    .line 19
    const/4 v9, 0x1

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-direct {p0, v1, v6, v7, v9}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->h:Lv/VText;

    .line 27
    .line 28
    sget-wide v6, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->m:J

    .line 29
    .line 30
    invoke-direct {p0, v1, v6, v7, v8}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->g:Lv/VText;

    .line 35
    .line 36
    sget-wide v10, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->m:J

    .line 37
    .line 38
    mul-long/2addr v10, v4

    .line 39
    invoke-direct {p0, v6, v10, v11, v9}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->i:Lv/VText;

    .line 44
    .line 45
    sget-wide v6, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->m:J

    .line 46
    .line 47
    const-wide/16 v10, 0x3

    .line 48
    .line 49
    mul-long/2addr v6, v10

    .line 50
    invoke-direct {p0, v5, v6, v7, v8}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    const/4 v6, 0x4

    .line 55
    new-array v6, v6, [Landroid/animation/Animator;

    .line 56
    .line 57
    aput-object v0, v6, v8

    .line 58
    .line 59
    aput-object v1, v6, v9

    .line 60
    .line 61
    aput-object v4, v6, v3

    .line 62
    .line 63
    aput-object v5, v6, v2

    .line 64
    .line 65
    invoke-virtual {p1, v6}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    invoke-direct {p0, v1, v6, v7, v9}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->h:Lv/VText;

    .line 74
    .line 75
    sget-wide v6, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->m:J

    .line 76
    .line 77
    invoke-direct {p0, v1, v6, v7, v8}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->g:Lv/VText;

    .line 82
    .line 83
    sget-wide v10, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->m:J

    .line 84
    .line 85
    mul-long/2addr v10, v4

    .line 86
    invoke-direct {p0, v6, v10, v11, v9}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->j0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    new-array v2, v2, [Landroid/animation/Animator;

    .line 91
    .line 92
    aput-object v0, v2, v8

    .line 93
    .line 94
    aput-object v1, v2, v9

    .line 95
    .line 96
    aput-object v4, v2, v3

    .line 97
    .line 98
    invoke-virtual {p1, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 99
    .line 100
    .line 101
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->l:Landroid/animation/AnimatorSet;

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public l0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->k:Z

    .line 8
    .line 9
    new-instance v0, Ll/feh0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/feh0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->l:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->l:Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->l:Landroid/animation/AnimatorSet;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
