.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView$d;
    }
.end annotation


# static fields
.field public static final s:Landroid/view/animation/LinearInterpolator;

.field public static final t:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView$d;

.field public static u:J


# instance fields
.field public d:Landroidx/constraintlayout/widget/Guideline;

.field public e:Landroidx/constraintlayout/widget/Guideline;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/AutoVDraweeView;

.field public h:Landroid/widget/FrameLayout;

.field public i:Lv/VDraweeView;

.field public j:Lv/VDraweeView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/ImageView;

.field public m:Landroid/widget/ImageView;

.field public n:Landroid/widget/ImageView;

.field public o:Landroid/widget/ImageView;

.field public p:Landroid/widget/ImageView;

.field public q:Landroid/view/View;

.field public r:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->s:Landroid/view/animation/LinearInterpolator;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView$d;

    .line 9
    .line 10
    const/high16 v1, 0x3f000000    # 0.5f

    .line 11
    .line 12
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView$d;-><init>(F)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->t:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView$d;

    .line 16
    .line 17
    const-wide/16 v0, 0x226

    .line 18
    .line 19
    sput-wide v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->u:J

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->r:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->init()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->r:Z

    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->r:Z

    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->init()V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;I[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->o0(I[I)V

    return-void
.end method

.method public static bridge synthetic i0(Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->r:Z

    return-void
.end method

.method private init()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/rec0;->h3:I

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->m0(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/bnl0;->w0()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/16 v1, 0x3c0

    .line 23
    .line 24
    if-ge v0, v1, :cond_0

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->s0()V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->p:Landroid/widget/ImageView;

    .line 30
    .line 31
    sget v1, Ll/jbc0;->b0:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->l:Landroid/widget/ImageView;

    .line 37
    .line 38
    sget v1, Ll/jbc0;->c8:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->m:Landroid/widget/ImageView;

    .line 44
    .line 45
    sget v1, Ll/jbc0;->a8:I

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->n:Landroid/widget/ImageView;

    .line 51
    .line 52
    sget v1, Ll/jbc0;->b8:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->o:Landroid/widget/ImageView;

    .line 58
    .line 59
    sget v1, Ll/jbc0;->d8:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 62
    .line 63
    .line 64
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->g:Lv/AutoVDraweeView;

    .line 73
    .line 74
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 77
    .line 78
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 92
    .line 93
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    const-string v2, "female"

    .line 98
    .line 99
    if-eqz v1, :cond_1

    .line 100
    .line 101
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_1

    .line 112
    .line 113
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->p0()V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 118
    .line 119
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_2

    .line 124
    .line 125
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 126
    .line 127
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    const-string v3, "male"

    .line 132
    .line 133
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-eqz v1, :cond_2

    .line 138
    .line 139
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->q0()V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 144
    .line 145
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_3

    .line 150
    .line 151
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->q0()V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->p0()V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->v0()V

    return-void
.end method

.method public static bridge synthetic k0(Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->w0()V

    return-void
.end method

.method public static bridge synthetic l0(Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->y0(Landroid/view/View;)V

    return-void
.end method

.method private p0()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->i:Lv/VDraweeView;

    .line 4
    .line 5
    sget v2, Ll/jbc0;->Zb:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->j:Lv/VDraweeView;

    .line 13
    .line 14
    sget v1, Ll/jbc0;->ac:I

    .line 15
    .line 16
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private q0()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->i:Lv/VDraweeView;

    .line 4
    .line 5
    sget v2, Ll/jbc0;->bc:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->j:Lv/VDraweeView;

    .line 13
    .line 14
    sget v1, Ll/jbc0;->cc:I

    .line 15
    .line 16
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private r0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->p:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private s0()V
    .locals 4

    .line 1
    const/high16 v0, 0x428c0000    # 70.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x42a80000    # 84.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->p:Landroid/widget/ImageView;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 20
    .line 21
    sget v3, Ll/qa00;->x:I

    .line 22
    .line 23
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 24
    .line 25
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 26
    .line 27
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->p:Landroid/widget/ImageView;

    .line 28
    .line 29
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->f:Landroid/widget/FrameLayout;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 39
    .line 40
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 41
    .line 42
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 43
    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->f:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->g:Lv/AutoVDraweeView;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 56
    .line 57
    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 58
    .line 59
    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 60
    .line 61
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->g:Lv/AutoVDraweeView;

    .line 62
    .line 63
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->h:Landroid/widget/FrameLayout;

    .line 67
    .line 68
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 73
    .line 74
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 75
    .line 76
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->h:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->i:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 90
    .line 91
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 92
    .line 93
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 94
    .line 95
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->i:Lv/VDraweeView;

    .line 96
    .line 97
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->j:Lv/VDraweeView;

    .line 101
    .line 102
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 107
    .line 108
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 109
    .line 110
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->j:Lv/VDraweeView;

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->d:Landroidx/constraintlayout/widget/Guideline;

    .line 118
    .line 119
    const v1, 0x3eeb851f    # 0.46f

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/widget/Guideline;->setGuidelinePercent(F)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->e:Landroidx/constraintlayout/widget/Guideline;

    .line 126
    .line 127
    const v0, 0x3f0a3d71    # 0.54f

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/widget/Guideline;->setGuidelinePercent(F)V

    .line 131
    .line 132
    .line 133
    return-void
.end method


# virtual methods
.method public final m0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/k5c0;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;
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
    move-result-object p4

    .line 49
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 50
    .line 51
    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p4, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p4, p2, p3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 58
    .line 59
    .line 60
    new-instance p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView$b;

    .line 61
    .line 62
    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView$b;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;Landroid/view/View;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p4, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 66
    .line 67
    .line 68
    return-object p4

    .line 69
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic o0(I[I)V
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    aget p2, p2, v0

    .line 3
    .line 4
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->f:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->f:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    neg-int v2, v2

    .line 18
    int-to-float v2, v2

    .line 19
    const/4 v4, 0x2

    .line 20
    new-array v5, v4, [F

    .line 21
    .line 22
    aput v2, v5, v0

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    const/4 v6, 0x0

    .line 26
    aput v6, v5, v2

    .line 27
    .line 28
    const-string v7, "translationX"

    .line 29
    .line 30
    invoke-static {v3, v7, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    sget-object v5, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->t:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView$d;

    .line 35
    .line 36
    invoke-virtual {v3, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 37
    .line 38
    .line 39
    const-wide/16 v8, 0x28a

    .line 40
    .line 41
    invoke-virtual {v3, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    .line 44
    iget-object v10, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->h:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    invoke-virtual {v10}, Landroid/view/View;->getLeft()I

    .line 47
    .line 48
    .line 49
    move-result v11

    .line 50
    sub-int/2addr p2, v11

    .line 51
    int-to-float p2, p2

    .line 52
    new-array v11, v4, [F

    .line 53
    .line 54
    aput p2, v11, v0

    .line 55
    .line 56
    aput v6, v11, v2

    .line 57
    .line 58
    invoke-static {v10, v7, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p2, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 63
    .line 64
    .line 65
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->p:Landroid/widget/ImageView;

    .line 66
    .line 67
    new-array v7, v4, [F

    .line 68
    .line 69
    fill-array-data v7, :array_0

    .line 70
    .line 71
    .line 72
    const-string v8, "alpha"

    .line 73
    .line 74
    invoke-static {v6, v8, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    sget-object v7, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->s:Landroid/view/animation/LinearInterpolator;

    .line 79
    .line 80
    invoke-virtual {v6, v7}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 81
    .line 82
    .line 83
    const-wide/16 v7, 0x96

    .line 84
    .line 85
    invoke-virtual {v6, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 86
    .line 87
    .line 88
    const-wide/16 v7, 0x1f4

    .line 89
    .line 90
    invoke-virtual {v6, v7, v8}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 94
    .line 95
    .line 96
    const/4 v5, 0x3

    .line 97
    new-array v5, v5, [Landroid/animation/Animator;

    .line 98
    .line 99
    aput-object v3, v5, v0

    .line 100
    .line 101
    aput-object p2, v5, v2

    .line 102
    .line 103
    aput-object v6, v5, v4

    .line 104
    .line 105
    invoke-virtual {v1, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 106
    .line 107
    .line 108
    int-to-long p1, p1

    .line 109
    invoke-virtual {v1, p1, p2}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 110
    .line 111
    .line 112
    new-instance p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView$a;

    .line 113
    .line 114
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView$a;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    nop

    .line 125
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public t0()V
    .locals 1

    .line 1
    const/16 v0, 0xfa

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->u0(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u0(I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->r:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->r0()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->r:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->q:Landroid/view/View;

    .line 13
    .line 14
    new-instance v1, Ll/j5c0;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/j5c0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;I)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final v0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->j:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v1, v1, [F

    .line 5
    .line 6
    fill-array-data v1, :array_0

    .line 7
    .line 8
    .line 9
    const-string v2, "alpha"

    .line 10
    .line 11
    invoke-static {v0, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->s:Landroid/view/animation/LinearInterpolator;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 18
    .line 19
    .line 20
    const-wide/16 v1, 0x7d0

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    .line 25
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView$c;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView$c;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final w0()V
    .locals 11

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->l:Landroid/widget/ImageView;

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    const/4 v4, 0x1

    .line 11
    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->n0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->n:Landroid/widget/ImageView;

    .line 16
    .line 17
    sget-wide v5, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->u:J

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {p0, v2, v5, v6, v3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->n0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->m:Landroid/widget/ImageView;

    .line 25
    .line 26
    sget-wide v6, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->u:J

    .line 27
    .line 28
    const-wide/16 v8, 0x2

    .line 29
    .line 30
    mul-long/2addr v6, v8

    .line 31
    invoke-virtual {p0, v5, v6, v7, v4}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->n0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->o:Landroid/widget/ImageView;

    .line 36
    .line 37
    sget-wide v7, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->u:J

    .line 38
    .line 39
    const-wide/16 v9, 0x3

    .line 40
    .line 41
    mul-long/2addr v7, v9

    .line 42
    invoke-virtual {p0, v6, v7, v8, v3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->n0(Landroid/view/View;JZ)Landroid/animation/ObjectAnimator;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/4 v6, 0x4

    .line 47
    new-array v6, v6, [Landroid/animation/Animator;

    .line 48
    .line 49
    aput-object v1, v6, v3

    .line 50
    .line 51
    aput-object v2, v6, v4

    .line 52
    .line 53
    const/4 v1, 0x2

    .line 54
    aput-object v5, v6, v1

    .line 55
    .line 56
    const/4 v1, 0x3

    .line 57
    aput-object p0, v6, v1

    .line 58
    .line 59
    invoke-virtual {v0, v6}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final y0(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    fill-array-data p0, :array_0

    .line 5
    .line 6
    .line 7
    const-string v0, "alpha"

    .line 8
    .line 9
    invoke-static {p1, v0, p0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->s:Landroid/view/animation/LinearInterpolator;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 16
    .line 17
    .line 18
    const-wide/16 v0, 0x96

    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    .line 23
    const-wide/16 v0, 0x15e

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
