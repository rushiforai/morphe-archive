.class public Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess$a;
    }
.end annotation


# static fields
.field public static final k:Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess$a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;

.field public b:Lv/VFrame;

.field public c:Lv/VDraweeView;

.field public d:Lv/VFrame;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Z

.field public i:Ll/qzz;

.field public j:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess$a;

    .line 2
    .line 3
    const v1, 0x3e19999a    # 0.15f

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess$a;-><init>(F)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->k:Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess$a;

    .line 10
    .line 11
    return-void
.end method

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
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->h:Z

    .line 6
    .line 7
    const/16 p1, 0x5dc

    .line 8
    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->j:I

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

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->h:Z

    const/16 p1, 0x5dc

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->j:I

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

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->h:Z

    const/16 p1, 0x5dc

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->j:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->e()V

    return-void
.end method

.method public static synthetic b()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->f()V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q4q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->c:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->e:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final f()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->b:Lv/VFrame;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    div-int/lit8 v2, v2, 0x3

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    mul-int/2addr v2, v3

    .line 13
    int-to-float v2, v2

    .line 14
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 15
    .line 16
    .line 17
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->b:Lv/VFrame;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    mul-int/2addr v2, v3

    .line 24
    int-to-float v2, v2

    .line 25
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotY(F)V

    .line 26
    .line 27
    .line 28
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->d:Lv/VFrame;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    div-int/lit8 v2, v2, 0x3

    .line 35
    .line 36
    int-to-float v2, v2

    .line 37
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 38
    .line 39
    .line 40
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->d:Lv/VFrame;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    mul-int/2addr v2, v3

    .line 47
    int-to-float v2, v2

    .line 48
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotY(F)V

    .line 49
    .line 50
    .line 51
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->b:Lv/VFrame;

    .line 52
    .line 53
    iget v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->j:I

    .line 54
    .line 55
    int-to-long v8, v1

    .line 56
    sget-object v16, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->k:Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess$a;

    .line 57
    .line 58
    new-array v11, v3, [F

    .line 59
    .line 60
    fill-array-data v11, :array_0

    .line 61
    .line 62
    .line 63
    sget-object v5, Landroid/view/View;->ROTATION:Landroid/util/Property;

    .line 64
    .line 65
    const-wide/16 v6, 0x0

    .line 66
    .line 67
    move-object/from16 v10, v16

    .line 68
    .line 69
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object v10, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->d:Lv/VFrame;

    .line 74
    .line 75
    iget v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->j:I

    .line 76
    .line 77
    int-to-long v14, v2

    .line 78
    new-array v2, v3, [F

    .line 79
    .line 80
    fill-array-data v2, :array_1

    .line 81
    .line 82
    .line 83
    const-wide/16 v12, 0x0

    .line 84
    .line 85
    move-object/from16 v17, v2

    .line 86
    .line 87
    move-object v11, v5

    .line 88
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    filled-new-array {v1, v2}, [Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    new-instance v2, Ll/o4q;

    .line 101
    .line 102
    invoke-direct {v2, v0}, Ll/o4q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v1, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 109
    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->i:Ll/qzz;

    .line 112
    .line 113
    new-instance v1, Ll/p4q;

    .line 114
    .line 115
    invoke-direct {v1}, Ll/p4q;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ll/qzz;->J1(Ll/x20;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    nop

    .line 123
    :array_0
    .array-data 4
        -0x3f400000    # -6.0f
        0x0
    .end array-data

    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    :array_1
    .array-data 4
        0x40c00000    # 6.0f
        0x0
    .end array-data
.end method

.method public g(Ll/qzz;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->i:Ll/qzz;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v0, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->c:Lv/VDraweeView;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v2, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 49
    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->e:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v2, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_0

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_0

    .line 78
    .line 79
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 80
    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->c:Lv/VDraweeView;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v1, v2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->e:Lv/VDraweeView;

    .line 93
    .line 94
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->g:Landroid/widget/TextView;

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->c1:I

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 114
    .line 115
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    invoke-static {v1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->h:Z

    .line 127
    .line 128
    if-nez p2, :cond_1

    .line 129
    .line 130
    const/4 p2, 0x1

    .line 131
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->h:Z

    .line 132
    .line 133
    const-string p2, "matched_left_time"

    .line 134
    .line 135
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {p2, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    filled-new-array {p2}, [Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    const-string p3, "e_chat_matched"

    .line 146
    .line 147
    const-string v0, "p_chat_view"

    .line 148
    .line 149
    invoke-static {p3, v0, p2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 150
    .line 151
    .line 152
    :cond_1
    invoke-virtual {p1}, Ll/qzz;->L0()Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    if-eqz p1, :cond_2

    .line 157
    .line 158
    new-instance p1, Ll/n4q;

    .line 159
    .line 160
    invoke-direct {p1, p0}, Ll/n4q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 164
    .line 165
    .line 166
    :cond_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->f:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->g:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->g:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget v1, Ll/g9c0;->i:I

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
