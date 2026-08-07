.class public Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;
    }
.end annotation


# static fields
.field public static n:Z = true

.field public static o:Z = true

.field public static p:I


# instance fields
.field public d:Z

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

.field public i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public j:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

.field public k:Landroid/animation/Animator;

.field public l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

.field public m:I


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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k:Landroid/animation/Animator;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->m:I

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->init()V

    .line 11
    .line 12
    .line 13
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

    .line 14
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k:Landroid/animation/Animator;

    const/4 p1, 0x0

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->m:I

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->init()V

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

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k:Landroid/animation/Animator;

    const/4 p1, 0x0

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->m:I

    .line 21
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->init()V

    return-void
.end method

.method private init()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->i0:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    sget v0, Ll/mdc0;->e6:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VDraweeView;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->e:Lv/VDraweeView;

    .line 24
    .line 25
    sget v0, Ll/mdc0;->j1:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lv/VDraweeView;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->f:Lv/VDraweeView;

    .line 34
    .line 35
    sget v0, Ll/mdc0;->i1:I

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 44
    .line 45
    sget v0, Ll/mdc0;->S4:I

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 54
    .line 55
    sget v0, Ll/mdc0;->q6:I

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 64
    .line 65
    sget v0, Ll/mdc0;->M0:I

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->j:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->e:Lv/VDraweeView;

    .line 76
    .line 77
    const/4 v1, 0x0

    .line 78
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->f:Lv/VDraweeView;

    .line 82
    .line 83
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 87
    .line 88
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 92
    .line 93
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->j:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 97
    .line 98
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public static o0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->p:I

    .line 3
    .line 4
    return-void
.end method

.method public static setEnableAnimMask(Z)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->o:Z

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    sput-boolean p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->o:Z

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public static setEnableMask(Z)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->n:Z

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    sput-boolean p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->n:Z

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "\u7531\u4e8e\u623f\u95f4\u4eba\u6570\u8f83\u591a\uff0c\u5df2\u5173\u95ed\u623f\u95f4\u5185\u90e8\u5206\u5934\u50cf\u6846\u663e\u793a"

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public getClickTarget()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    return-object p0
.end method

.method public getCountDownProgressView()Lcom/p1/mobile/putong/live/base/view/CircularProgressView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->j:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLongClickArea()Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;->AVATAR:Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0()V
    .locals 10

    .line 1
    sget-object v0, Ll/y6s;->a:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sput-boolean v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->n:Z

    .line 10
    .line 11
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->m:I

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 18
    .line 19
    if-lez v2, :cond_1

    .line 20
    .line 21
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    if-lez v0, :cond_1

    .line 24
    .line 25
    move v1, v0

    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception v0

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    :goto_0
    move v6, v1

    .line 30
    goto :goto_2

    .line 31
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->e:Lv/VDraweeView;

    .line 36
    .line 37
    sget-boolean v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->n:Z

    .line 38
    .line 39
    const/4 v8, 0x0

    .line 40
    const/4 v9, 0x1

    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->d:Z

    .line 44
    .line 45
    if-eqz v1, :cond_3

    .line 46
    .line 47
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->a:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_3

    .line 56
    .line 57
    move v1, v9

    .line 58
    goto :goto_3

    .line 59
    :cond_3
    move v1, v8

    .line 60
    :goto_3
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    sget-boolean v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->n:Z

    .line 64
    .line 65
    if-nez v0, :cond_4

    .line 66
    .line 67
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->d:Z

    .line 68
    .line 69
    if-eqz v0, :cond_5

    .line 70
    .line 71
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->e:Lv/VDraweeView;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->a:Ljava/lang/String;

    .line 76
    .line 77
    const-string v2, "context_livingAct"

    .line 78
    .line 79
    invoke-static {v2, v0, v1, v6, v6}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 80
    .line 81
    .line 82
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->f:Lv/VDraweeView;

    .line 83
    .line 84
    sget-boolean v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->n:Z

    .line 85
    .line 86
    if-nez v1, :cond_6

    .line 87
    .line 88
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->d:Z

    .line 89
    .line 90
    if-eqz v1, :cond_7

    .line 91
    .line 92
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 93
    .line 94
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_7

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 103
    .line 104
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v1}, Ll/xau;->z(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-nez v1, :cond_7

    .line 111
    .line 112
    move v1, v9

    .line 113
    goto :goto_4

    .line 114
    :cond_7
    move v1, v8

    .line 115
    :goto_4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 119
    .line 120
    sget-boolean v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->n:Z

    .line 121
    .line 122
    if-nez v1, :cond_8

    .line 123
    .line 124
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->d:Z

    .line 125
    .line 126
    if-eqz v1, :cond_9

    .line 127
    .line 128
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 129
    .line 130
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-nez v1, :cond_9

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 139
    .line 140
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 141
    .line 142
    invoke-static {v1}, Ll/xau;->z(Ljava/lang/String;)Z

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-eqz v1, :cond_9

    .line 147
    .line 148
    move v1, v9

    .line 149
    goto :goto_5

    .line 150
    :cond_9
    move v1, v8

    .line 151
    :goto_5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    sget-boolean v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->n:Z

    .line 155
    .line 156
    if-nez v0, :cond_b

    .line 157
    .line 158
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->d:Z

    .line 159
    .line 160
    if-eqz v0, :cond_a

    .line 161
    .line 162
    goto :goto_7

    .line 163
    :cond_a
    :goto_6
    move-object v2, p0

    .line 164
    goto :goto_8

    .line 165
    :cond_b
    :goto_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 166
    .line 167
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 168
    .line 169
    invoke-static {v0}, Ll/xau;->z(Ljava/lang/String;)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_d

    .line 174
    .line 175
    invoke-static {}, Ll/i9n;->b()Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 180
    .line 181
    const/4 v2, 0x0

    .line 182
    if-eqz v0, :cond_c

    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 185
    .line 186
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {v1, v0, v9, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 189
    .line 190
    .line 191
    goto :goto_6

    .line 192
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 193
    .line 194
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 195
    .line 196
    const/4 v3, -0x1

    .line 197
    invoke-virtual {v1, v0, v3, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 198
    .line 199
    .line 200
    goto :goto_6

    .line 201
    :cond_d
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->f:Lv/VDraweeView;

    .line 202
    .line 203
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 204
    .line 205
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 206
    .line 207
    const-string v3, "context_single_room"

    .line 208
    .line 209
    move v7, v6

    .line 210
    move-object v2, p0

    .line 211
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->m0(Ljava/lang/String;Lv/VDraweeView;Ljava/lang/String;II)V

    .line 212
    .line 213
    .line 214
    :goto_8
    iget-object p0, v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 215
    .line 216
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->c:Ljava/lang/String;

    .line 217
    .line 218
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 219
    .line 220
    .line 221
    move-result p0

    .line 222
    if-nez p0, :cond_f

    .line 223
    .line 224
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l0()Z

    .line 225
    .line 226
    .line 227
    move-result p0

    .line 228
    iget-object v0, v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 229
    .line 230
    if-eqz p0, :cond_e

    .line 231
    .line 232
    invoke-static {v0, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 233
    .line 234
    .line 235
    iget-object p0, v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 236
    .line 237
    invoke-static {p0, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-static {p0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    iget-object v0, v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 249
    .line 250
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->c:Ljava/lang/String;

    .line 251
    .line 252
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    invoke-virtual {p0, v9}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    iget-object v0, v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 261
    .line 262
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 263
    .line 264
    .line 265
    goto :goto_9

    .line 266
    :cond_e
    invoke-static {v0, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 267
    .line 268
    .line 269
    iget-object p0, v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 270
    .line 271
    invoke-static {p0, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 272
    .line 273
    .line 274
    iget-object p0, v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 275
    .line 276
    iget v0, v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->m:I

    .line 277
    .line 278
    int-to-float v0, v0

    .line 279
    const/high16 v1, 0x3f400000    # 0.75f

    .line 280
    .line 281
    mul-float/2addr v0, v1

    .line 282
    float-to-int v0, v0

    .line 283
    iget-object v1, v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 284
    .line 285
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->c:Ljava/lang/String;

    .line 286
    .line 287
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;->w(ILjava/lang/String;)V

    .line 288
    .line 289
    .line 290
    :cond_f
    :goto_9
    return-void
.end method

.method public i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->e:Lv/VDraweeView;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->f:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;->v()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public j0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->j:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->j:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public k0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final l0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->e:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "svga"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->e:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->c:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public final m0(Ljava/lang/String;Lv/VDraweeView;Ljava/lang/String;II)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    return-void

    .line 11
    :cond_1
    new-instance p0, Ll/r230$j;

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ll/r230$j;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p3}, Ll/r230$j;->b(Ljava/lang/String;)Ll/r230$f;

    .line 17
    .line 18
    .line 19
    if-eqz p4, :cond_2

    .line 20
    .line 21
    if-eqz p5, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0, p4, p5}, Ll/r230$j;->o(II)Ll/r230$j;

    .line 24
    .line 25
    .line 26
    :cond_2
    sget-boolean p1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->o:Z

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/r230$j;->l(Z)Ll/r230$j;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/r230$j;->k()Ll/r230;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p2}, Ll/r230;->E(Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 37
    .line 38
    .line 39
    sget p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->p:I

    .line 40
    .line 41
    add-int/lit8 p0, p0, 0x1

    .line 42
    .line 43
    sput p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->p:I

    .line 44
    .line 45
    const/16 p1, 0x1e

    .line 46
    .line 47
    if-lt p0, p1, :cond_3

    .line 48
    .line 49
    invoke-static {}, Ll/r230;->s()V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    sput p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->p:I

    .line 54
    .line 55
    :cond_3
    return-void
.end method

.method public n0(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->j:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->j:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->j:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->setProgress(F)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->t0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->j0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/wlj;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public q0(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v2, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move-object v3, p2

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->r0(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r0(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, ",avatarUrl:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ",dynamicCoverUrl:"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, ",suggestSize:"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "FansBoardTAG-CommonMaskAvatarView-setImageUrlData\uff0cstaticCoverUrl:"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    if-lez p1, :cond_0

    .line 43
    .line 44
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->m:I

    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 47
    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->a:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->c:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_1

    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p1, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_1

    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 80
    .line 81
    if-nez p1, :cond_2

    .line 82
    .line 83
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 84
    .line 85
    invoke-direct {p1, p3, p4, p5}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 89
    .line 90
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 91
    .line 92
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    const-string v1, ""

    .line 97
    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    move-object p3, v1

    .line 101
    :cond_3
    iput-object p3, p1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->a:Ljava/lang/String;

    .line 102
    .line 103
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 104
    .line 105
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    if-eqz p3, :cond_4

    .line 110
    .line 111
    move-object p4, v1

    .line 112
    :cond_4
    iput-object p4, p1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->c:Ljava/lang/String;

    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 115
    .line 116
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result p3

    .line 120
    if-eqz p3, :cond_5

    .line 121
    .line 122
    move-object p5, v1

    .line 123
    :cond_5
    iput-object p5, p1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 124
    .line 125
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->l:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;

    .line 126
    .line 127
    iput-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->e:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->h0()V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public s0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k:Landroid/animation/Animator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->e:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v1, 0x4

    .line 8
    new-array v1, v1, [F

    .line 9
    .line 10
    fill-array-data v1, :array_0

    .line 11
    .line 12
    .line 13
    const-string v2, "rotation"

    .line 14
    .line 15
    invoke-static {v0, v2, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-wide/16 v1, 0xc8

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k:Landroid/animation/Animator;

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k:Landroid/animation/Animator;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k:Landroid/animation/Animator;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    nop

    .line 43
    :array_0
    .array-data 4
        0x0
        0x41f00000    # 30.0f
        -0x3e100000    # -30.0f
        0x0
    .end array-data
.end method

.method public setLongClickArea(Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public setMaskUnLimit(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public t0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->e:Lv/VDraweeView;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setRotation(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
