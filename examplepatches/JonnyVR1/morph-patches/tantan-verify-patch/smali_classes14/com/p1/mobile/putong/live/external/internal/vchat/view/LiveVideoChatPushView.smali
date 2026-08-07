.class public Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/gru;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VFrame;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:Lv/VFrame;

.field public f:Lv/VFrame;

.field public g:Lv/VDraweeView;

.field public h:Ll/gru;

.field public i:Z

.field public j:Landroid/view/ViewGroup$LayoutParams;

.field public k:Landroid/view/ViewGroup$LayoutParams;

.field public l:Ljava/lang/Runnable;

.field public final m:Ljava/lang/Runnable;


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
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->i:Z

    .line 6
    .line 7
    new-instance p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->l:Ljava/lang/Runnable;

    .line 13
    .line 14
    new-instance p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$b;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$b;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->m:Ljava/lang/Runnable;

    .line 20
    .line 21
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

    .line 22
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->i:Z

    .line 24
    new-instance p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->l:Ljava/lang/Runnable;

    .line 25
    new-instance p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$b;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->m:Ljava/lang/Runnable;

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

    .line 26
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 27
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->i:Z

    .line 28
    new-instance p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->l:Ljava/lang/Runnable;

    .line 29
    new-instance p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$b;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->m:Ljava/lang/Runnable;

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

    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->i:Z

    .line 32
    new-instance p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->l:Ljava/lang/Runnable;

    .line 33
    new-instance p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$b;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->m:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->n(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->j:Landroid/view/ViewGroup$LayoutParams;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->k:Landroid/view/ViewGroup$LayoutParams;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->i:Z

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->setPushChildOrder(Z)V

    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->h:Ll/gru;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->k()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->h:Ll/gru;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/gru;->i3()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->i:Z

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->l(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private setPushChildOrder(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->a:Lv/VFrame;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->bringToFront()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->b:Lv/VFrame;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->bringToFront()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->e:Lv/VFrame;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->bringToFront()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->e:Lv/VFrame;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->bringToFront()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->b:Lv/VFrame;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->bringToFront()V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->a:Lv/VFrame;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->bringToFront()V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rxu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gru;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->j(Ll/gru;)V

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

.method public j(Ll/gru;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->h:Ll/gru;

    .line 2
    .line 3
    return-void
.end method

.method public final k()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->b:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public l(Z)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->i:Z

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->m:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->l:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->i:Z

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->h:Ll/gru;

    .line 19
    .line 20
    const-wide/16 v1, 0x1f4

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/ahu;->N2()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->h:Ll/gru;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/ahu;->H2()Ll/xnu;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/xnu;->u()Ll/gcl0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Ll/gcl0;->a()Ll/tzl;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-interface {p1, v0, v3}, Ll/tzl;->C(II)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->h:Ll/gru;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->l:Ljava/lang/Runnable;

    .line 62
    .line 63
    invoke-static {p1, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    invoke-virtual {v0}, Ll/ahu;->N2()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->g:Lv/VDraweeView;

    .line 74
    .line 75
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-nez p1, :cond_3

    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->h:Ll/gru;

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/ahu;->H2()Ll/xnu;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Ll/xnu;->u()Ll/gcl0;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1}, Ll/gcl0;->a()Ll/tzl;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    invoke-interface {p1, v0, v3}, Ll/tzl;->C(II)V

    .line 104
    .line 105
    .line 106
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->g:Lv/VDraweeView;

    .line 107
    .line 108
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_4

    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->m:Ljava/lang/Runnable;

    .line 115
    .line 116
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->h:Ll/gru;

    .line 121
    .line 122
    invoke-virtual {p1}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->m:Ljava/lang/Runnable;

    .line 127
    .line 128
    invoke-static {p1, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public onFinishInflate()V
    .locals 7

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->g:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->c:Landroid/view/View;

    .line 14
    .line 15
    const-string v2, "#4d000000"

    .line 16
    .line 17
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const-string v4, "#00000000"

    .line 22
    .line 23
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    sget-object v6, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 28
    .line 29
    invoke-static {v3, v5, v1, v6}, Ll/fc2;->k(IIILandroid/graphics/drawable/GradientDrawable$Orientation;)Landroid/graphics/drawable/GradientDrawable;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->d:Landroid/view/View;

    .line 37
    .line 38
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-static {v3, v2, v1, v6}, Ll/fc2;->k(IIILandroid/graphics/drawable/GradientDrawable$Orientation;)Landroid/graphics/drawable/GradientDrawable;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/nxu;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/nxu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->e:Lv/VFrame;

    .line 62
    .line 63
    new-instance v1, Ll/oxu;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/oxu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->a:Lv/VFrame;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->j:Landroid/view/ViewGroup$LayoutParams;

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->e:Lv/VFrame;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->k:Landroid/view/ViewGroup$LayoutParams;

    .line 86
    .line 87
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->b:Lv/VFrame;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->i:Z

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->setSurfaceViewOrder(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setSurfaceViewOrder(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->a:Lv/VFrame;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->a:Lv/VFrame;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    instance-of v0, v0, Landroid/view/SurfaceView;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->a:Lv/VFrame;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/view/SurfaceView;

    .line 27
    .line 28
    xor-int/lit8 v2, p1, 0x1

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 31
    .line 32
    .line 33
    xor-int/lit8 v2, p1, 0x1

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->f:Lv/VFrame;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-lez v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->f:Lv/VFrame;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    instance-of v0, v0, Landroid/view/SurfaceView;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->f:Lv/VFrame;

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Landroid/view/SurfaceView;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method public u(ZLcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->g:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->g:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->getAttendee()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->avatar:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {}, Ll/bnl0;->y0()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    invoke-static {}, Ll/bnl0;->w0()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const-string v1, "video_chat"

    .line 31
    .line 32
    invoke-static {v1, p0, p1, p2, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
