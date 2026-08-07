.class public Ll/u1u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s1u;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;

.field public b:Ll/wwr;

.field public c:Ll/xwr;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xwr;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/xwr;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/u1u;->c:Ll/xwr;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Lv/VDraweeView;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    const/16 p0, 0x26

    .line 12
    .line 13
    if-lt p3, p0, :cond_0

    .line 14
    .line 15
    sget p0, Ll/i0k;->b:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget p0, Ll/i0k;->a:I

    .line 19
    .line 20
    :goto_0
    invoke-static {p2, p1, p0}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public b(Landroid/view/View;Ljava/util/List;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;I)V"
        }
    .end annotation

    .line 1
    iget-object p3, p0, Ll/u1u;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    instance-of p3, p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;

    .line 7
    .line 8
    if-eqz p3, :cond_2

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    check-cast p3, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 15
    .line 16
    sget v0, Ll/qa00;->j:I

    .line 17
    .line 18
    iput v0, p3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 19
    .line 20
    iput v0, p3, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 21
    .line 22
    invoke-virtual {p1, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    new-instance p3, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ll/bkj0;

    .line 45
    .line 46
    new-instance v1, Ll/xwr$a;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/xwr$a;-><init>()V

    .line 49
    .line 50
    .line 51
    new-instance v2, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 52
    .line 53
    invoke-direct {v2}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;-><init>()V

    .line 54
    .line 55
    .line 56
    const/4 v3, 0x1

    .line 57
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->setType(I)V

    .line 58
    .line 59
    .line 60
    iget-object v3, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast v3, Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->setGoData(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v2}, Ll/xwr$a;->e(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v0, Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Ll/xwr$a;->f(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    new-instance p2, Ll/xwr;

    .line 82
    .line 83
    invoke-direct {p2}, Ll/xwr;-><init>()V

    .line 84
    .line 85
    .line 86
    iput-object p2, p0, Ll/u1u;->c:Ll/xwr;

    .line 87
    .line 88
    invoke-virtual {p2, p3}, Ll/xwr;->e(Ljava/util/List;)V

    .line 89
    .line 90
    .line 91
    iget-object p2, p0, Ll/u1u;->c:Ll/xwr;

    .line 92
    .line 93
    const/4 p3, 0x0

    .line 94
    iput-boolean p3, p2, Ll/xwr;->localAutoScroll:Z

    .line 95
    .line 96
    new-instance p2, Ll/wwr;

    .line 97
    .line 98
    new-instance p3, Ll/hk4;

    .line 99
    .line 100
    iget-object v0, p0, Ll/u1u;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;

    .line 101
    .line 102
    invoke-direct {p3, v0}, Ll/hk4;-><init>(Ll/ner;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/u1u;->c:Ll/xwr;

    .line 106
    .line 107
    invoke-direct {p2, p3, v0}, Ll/wwr;-><init>(Ll/hk4;Ll/xwr;)V

    .line 108
    .line 109
    .line 110
    iput-object p2, p0, Ll/u1u;->b:Ll/wwr;

    .line 111
    .line 112
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;

    .line 113
    .line 114
    invoke-virtual {p2, p1}, Ll/wwr;->S(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;)V

    .line 115
    .line 116
    .line 117
    :cond_2
    :goto_1
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/u1u;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;

    .line 3
    .line 4
    return-void
.end method

.method public d(Landroidx/fragment/app/Fragment;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;

    .line 6
    .line 7
    iput-object p1, p0, Ll/u1u;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->g:I

    .line 2
    .line 3
    return p0
.end method
