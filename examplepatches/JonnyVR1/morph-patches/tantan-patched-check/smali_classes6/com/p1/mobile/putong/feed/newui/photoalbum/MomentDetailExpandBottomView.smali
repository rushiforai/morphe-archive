.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Ll/n570;

.field public e:Ll/di5;

.field public f:I

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Lcom/p1/mobile/putong/data/Links;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->n:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->n:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->n:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->h(Ll/pf60;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->i(Ll/pf60;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->j(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/di00;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h(Ll/pf60;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->j:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->j:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->e:Ll/di5;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->i:Ljava/lang/String;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v1, v2}, Ll/di5;->f0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    :goto_0
    move v6, v0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    const/4 v0, 0x1

    .line 31
    goto :goto_0

    .line 32
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->e:Ll/di5;

    .line 33
    .line 34
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->f:I

    .line 35
    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->i:Ljava/lang/String;

    .line 37
    .line 38
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 39
    .line 40
    move-object v4, p0

    .line 41
    check-cast v4, Ljava/util/List;

    .line 42
    .line 43
    iget-object p0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 44
    .line 45
    move-object v5, p0

    .line 46
    check-cast v5, Lcom/p1/mobile/putong/data/Links;

    .line 47
    .line 48
    invoke-virtual/range {v1 .. v6}, Ll/di5;->P(ILjava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/data/Links;Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic i(Ll/pf60;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->j:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->j:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->e:Ll/di5;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->i:Ljava/lang/String;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v1, v2}, Ll/di5;->f0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    :goto_0
    move v6, v0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    const/4 v0, 0x1

    .line 31
    goto :goto_0

    .line 32
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->e:Ll/di5;

    .line 33
    .line 34
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->f:I

    .line 35
    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->i:Ljava/lang/String;

    .line 37
    .line 38
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 39
    .line 40
    move-object v4, p0

    .line 41
    check-cast v4, Ljava/util/List;

    .line 42
    .line 43
    iget-object p0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 44
    .line 45
    move-object v5, p0

    .line 46
    check-cast v5, Lcom/p1/mobile/putong/data/Links;

    .line 47
    .line 48
    invoke-virtual/range {v1 .. v6}, Ll/di5;->P(ILjava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/data/Links;Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->e:Ll/di5;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_4

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->e:Ll/di5;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->i:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/di5;->Y(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->e:Ll/di5;

    .line 20
    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->f:I

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->i:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v3, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    const/4 v4, 0x0

    .line 31
    const/4 v5, 0x0

    .line 32
    invoke-virtual/range {v0 .. v5}, Ll/di5;->P(ILjava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/data/Links;Z)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->n:Z

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->d:Ll/n570;

    .line 39
    .line 40
    const-string v1, ""

    .line 41
    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    move-object p1, v1

    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->m:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->k:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->l:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->i:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->j:Lcom/p1/mobile/putong/data/Links;

    .line 54
    .line 55
    if-nez v5, :cond_1

    .line 56
    .line 57
    :goto_0
    move-object v5, p1

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    iget-object p1, v5, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :goto_1
    invoke-virtual/range {v0 .. v5}, Ll/n570;->x(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance v0, Ll/zh00;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Ll/zh00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;)V

    .line 69
    .line 70
    .line 71
    new-instance p0, Ll/ai00;

    .line 72
    .line 73
    invoke-direct {p0}, Ll/ai00;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    move-object p1, v1

    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->m:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->g:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->h:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->i:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->j:Lcom/p1/mobile/putong/data/Links;

    .line 94
    .line 95
    if-nez v5, :cond_3

    .line 96
    .line 97
    :goto_2
    move-object v5, p1

    .line 98
    goto :goto_3

    .line 99
    :cond_3
    iget-object p1, v5, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :goto_3
    invoke-virtual/range {v0 .. v5}, Ll/n570;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    new-instance v0, Ll/bi00;

    .line 107
    .line 108
    invoke-direct {v0, p0}, Ll/bi00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;)V

    .line 109
    .line 110
    .line 111
    new-instance p0, Ll/ci00;

    .line 112
    .line 113
    invoke-direct {p0}, Ll/ci00;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    :cond_4
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->e:Ll/di5;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->e:Ll/di5;

    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->f:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->i:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, v0, p0}, Ll/di5;->c0(ILjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public l(Ll/n570;Ll/di5;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;Ljava/lang/String;ZI)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->e:Ll/di5;

    .line 2
    .line 3
    iput p9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->f:I

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->d:Ll/n570;

    .line 6
    .line 7
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->g:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->h:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->i:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->j:Lcom/p1/mobile/putong/data/Links;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->n:Z

    .line 17
    .line 18
    iput-object p7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->m:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->c:Lv/VText;

    .line 21
    .line 22
    invoke-static {p1, p8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->b:Lv/VText;

    .line 26
    .line 27
    xor-int/lit8 p1, p8, 0x1

    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public m(Ll/n570;Ll/di5;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;Ljava/lang/String;ZI)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->e:Ll/di5;

    .line 2
    .line 3
    iput p9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->f:I

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->d:Ll/n570;

    .line 6
    .line 7
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->k:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->l:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->i:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->j:Lcom/p1/mobile/putong/data/Links;

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->n:Z

    .line 17
    .line 18
    iput-object p7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->m:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->c:Lv/VText;

    .line 21
    .line 22
    invoke-static {p2, p8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->b:Lv/VText;

    .line 26
    .line 27
    xor-int/2addr p1, p8

    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->b:Lv/VText;

    .line 8
    .line 9
    new-instance v1, Ll/xh00;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/xh00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->c:Lv/VText;

    .line 18
    .line 19
    new-instance v1, Ll/yh00;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/yh00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
