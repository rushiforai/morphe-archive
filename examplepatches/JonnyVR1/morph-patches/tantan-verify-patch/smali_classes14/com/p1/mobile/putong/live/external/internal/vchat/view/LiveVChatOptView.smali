.class public Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/iqu;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

.field public f:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

.field public g:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

.field public h:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

.field public i:Lv/VDraweeView;

.field public j:Ll/iqu;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:J


# direct methods
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

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->z0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->u0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->w0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->y0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->v0(Ljava/lang/Boolean;)V

    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->i:Lv/VDraweeView;

    .line 2
    .line 3
    sget v1, Ll/nbc0;->U0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 9
    .line 10
    sget v1, Ll/nbc0;->X0:I

    .line 11
    .line 12
    invoke-virtual {v0, v1, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;->c(II)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 16
    .line 17
    sget v1, Ll/nbc0;->k:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 23
    .line 24
    sget v1, Ll/nbc0;->W0:I

    .line 25
    .line 26
    sget v2, Ll/nbc0;->V0:I

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;->c(II)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->e:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 32
    .line 33
    sget v1, Ll/nbc0;->Z0:I

    .line 34
    .line 35
    sget v2, Ll/nbc0;->Y0:I

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;->c(II)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->h:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 41
    .line 42
    sget v1, Ll/nbc0;->a1:I

    .line 43
    .line 44
    invoke-virtual {v0, v1, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;->c(II)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->h:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 48
    .line 49
    sget v1, Ll/nbc0;->k:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->i:Lv/VDraweeView;

    .line 55
    .line 56
    new-instance v1, Ll/jqu;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/jqu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->e:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 65
    .line 66
    new-instance v1, Ll/kqu;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/kqu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;->setSelectListener(Ll/y20;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 75
    .line 76
    new-instance v1, Ll/lqu;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/lqu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;->setSelectListener(Ll/y20;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 85
    .line 86
    new-instance v1, Ll/mqu;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/mqu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->h:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 95
    .line 96
    new-instance v1, Ll/nqu;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/nqu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method private synthetic t0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->j:Ll/iqu;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/ahu;->H2()Ll/xnu;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object v0, Ll/yuk0;->e:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->j:Ll/iqu;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0}, Ll/btu;->n(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic u0(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->j:Ll/iqu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->k()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    xor-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-static {p0}, Ll/btu;->q(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic w0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->j:Ll/iqu;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->p(Ll/ahu;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-static {}, Ll/btu;->o()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic y0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->j:Ll/iqu;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/iqu;->k3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public B0(ZLjava/lang/String;J)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->d:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    :goto_0
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    cmp-long p1, p3, v0

    .line 20
    .line 21
    if-gez p1, :cond_1

    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    const-wide/16 v0, 0x3e8

    .line 25
    .line 26
    mul-long/2addr p3, v0

    .line 27
    long-to-double p3, p3

    .line 28
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->n0(D)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string p3, "randomCoupon"

    .line 33
    .line 34
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_2

    .line 39
    .line 40
    const-string p2, "\u968f\u673a\u5339\u914d\u5269\u4f59\u65f6\u957f\n"

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    const-string p2, "\u5012\u8ba1\u65f6"

    .line 44
    .line 45
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->d:Lv/VText;

    .line 46
    .line 47
    new-instance p3, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public D0(Ljava/lang/String;J)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->l:Ljava/lang/String;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->m:J

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->r0()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->E0(Ljava/lang/String;J)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public final E0(Ljava/lang/String;J)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->r0()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/zvk;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->j:Ll/iqu;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v0, v1}, Ll/zvk;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ll/zvk;->u(Ljava/lang/String;)Ll/zvk;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "#fe7e1d"

    .line 27
    .line 28
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    filled-new-array {v0}, [I

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, Ll/zvk;->e([I)Ll/zvk;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 v0, 0x1

    .line 41
    invoke-virtual {p1, v0}, Ll/zvk;->k(Z)Ll/zvk;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    sget v0, Ll/qa00;->i:I

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Ll/zvk;->p(I)Ll/zvk;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const/16 v1, 0xd

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Ll/zvk;->t(I)Ll/zvk;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual {p1, v1}, Ll/zvk;->v(Z)Ll/zvk;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1, v0, v0, v0, v0}, Ll/zvk;->s(IIII)Ll/zvk;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    sget v0, Ll/zvk;->D:I

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Ll/zvk;->i(I)Ll/zvk;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance v0, Ll/oqu;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ll/oqu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v0}, Ll/zvk;->d(Ll/zvk$b;)Ll/zvk;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-wide/16 v0, 0x3e8

    .line 82
    .line 83
    mul-long/2addr p2, v0

    .line 84
    invoke-virtual {p1, p2, p3}, Ll/zvk;->a(J)Ll/zvk;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 93
    .line 94
    invoke-virtual {p2, p1, p3}, Ll/fwk;->t(Ll/zvk;Landroid/view/View;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->k:Ljava/lang/String;

    .line 99
    .line 100
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/iqu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->p0(Ll/iqu;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public n0(D)Ljava/lang/String;
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmpg-double p0, p1, v0

    .line 4
    .line 5
    if-gtz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "00:00"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-wide v0, 0x414b774000000000L    # 3600000.0

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    div-double v0, p1, v0

    .line 16
    .line 17
    double-to-int p0, v0

    .line 18
    int-to-long v0, p0

    .line 19
    const-wide/32 v2, 0x36ee80

    .line 20
    .line 21
    .line 22
    mul-long/2addr v0, v2

    .line 23
    long-to-double v0, v0

    .line 24
    sub-double/2addr p1, v0

    .line 25
    const-wide v0, 0x40ed4c0000000000L    # 60000.0

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    div-double v0, p1, v0

    .line 31
    .line 32
    double-to-int p0, v0

    .line 33
    int-to-long v0, p0

    .line 34
    const-wide/32 v2, 0xea60

    .line 35
    .line 36
    .line 37
    mul-long/2addr v0, v2

    .line 38
    long-to-double v0, v0

    .line 39
    sub-double/2addr p1, v0

    .line 40
    const-wide v0, 0x408f400000000000L    # 1000.0

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    div-double/2addr p1, v0

    .line 46
    double-to-int p1, p1

    .line 47
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "%02d:%02d "

    .line 64
    .line 65
    invoke-static {p2, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public final o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pqu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->o0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p0(Ll/iqu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->j:Ll/iqu;

    .line 2
    .line 3
    return-void
.end method

.method public q0()V
    .locals 3

    .line 1
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    xor-int/lit8 v1, v0, 0x1

    .line 6
    .line 7
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->k:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->k:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, p0, v1}, Ll/fwk;->q(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->l:Ljava/lang/String;

    .line 31
    .line 32
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->m:J

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->E0(Ljava/lang/String;J)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public final r0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->k:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->k:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method public s0(ZZ)V
    .locals 1

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->e:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 7
    .line 8
    xor-int/lit8 v0, p2, 0x1

    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 14
    .line 15
    xor-int/lit8 v0, p2, 0x1

    .line 16
    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    xor-int/2addr p2, v0

    .line 24
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->e:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 28
    .line 29
    const/4 p2, 0x0

    .line 30
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;->setSelectedUI(Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;->setSelectedUI(Z)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public setGiftButtonVisible(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->h:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatOptItemView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v0(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->j:Ll/iqu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->a()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    xor-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-static {p0}, Ll/btu;->r(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic z0(Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->k:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->l:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method
