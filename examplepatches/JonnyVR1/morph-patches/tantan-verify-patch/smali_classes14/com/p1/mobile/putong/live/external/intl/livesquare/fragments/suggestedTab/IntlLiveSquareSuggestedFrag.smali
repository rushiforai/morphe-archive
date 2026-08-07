.class public Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;
.super Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag<",
        "Ll/r9o;",
        ">;",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;"
    }
.end annotation


# instance fields
.field public S:Ll/y8o;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O5(Ll/d3q;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p0, Ll/b9o;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of p0, p0, Ll/n4o;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic P5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;Ll/d3q;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->V5(Ll/d3q;)V

    return-void
.end method

.method public static synthetic Q5(Ll/d3q;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p0, Ll/e2o;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of p0, p0, Ll/z3o;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public bridge synthetic B5(Ll/k4o;)V
    .locals 0

    .line 1
    check-cast p1, Ll/r9o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->S5(Ll/r9o;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final R5(Ll/z8o;Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z8o;",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->E5(Ll/z8o;Z)Ll/j5o;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    invoke-static {p2}, Ll/p1o;->b(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public S5(Ll/r9o;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->B5(Ll/k4o;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T5(Landroid/view/View;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ll/d8o<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ll/z3o;

    .line 5
    .line 6
    iget p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/z3o;-><init>(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x2

    .line 12
    invoke-virtual {v0, p0}, Ll/d8o;->J(I)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public U4(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->U4(Landroid/view/View;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/r9o;

    .line 5
    .line 6
    new-instance p2, Ll/nus;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Z4()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p2, v0, p0}, Ll/nus;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p1, p0, p2}, Ll/r9o;-><init>(Ll/ner;Ll/nus;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/l6t;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public U5(Landroid/view/View;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ns()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    add-int/lit8 v0, v0, -0x1

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    add-int/lit8 v2, v1, -0x1

    .line 24
    .line 25
    if-le v0, v2, :cond_1

    .line 26
    .line 27
    move v0, v1

    .line 28
    :cond_1
    new-instance v1, Ll/n4o;

    .line 29
    .line 30
    iget v2, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-direct {v1, p1, v2, p0}, Ll/n4o;-><init>(Landroid/view/View;ILcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {p2, v0, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic V5(Ll/d3q;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->S:Ll/y8o;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    instance-of v0, p1, Ll/y8o;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, p1

    .line 10
    check-cast v0, Ll/y8o;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->S:Ll/y8o;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 15
    .line 16
    new-instance v1, Ll/vvk;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->O:Ll/k4o;

    .line 19
    .line 20
    check-cast p0, Ll/r9o;

    .line 21
    .line 22
    iget-boolean p0, p0, Ll/r9o;->n:Z

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/vvk;-><init>(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public W5(Ll/z8o;Ljava/util/List;Landroid/util/Pair;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z8o;",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;",
            "Landroid/util/Pair<",
            "Landroid/view/View;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p1, Ll/ubu;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p1, Ll/ubu;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->L:Ll/m4o;

    .line 20
    .line 21
    invoke-virtual {v3, v2, v1}, Ll/m4o;->c(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;I)Ll/y8o;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    iget-object v1, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v1, Landroid/view/View;

    .line 40
    .line 41
    invoke-virtual {p0, v1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->U5(Landroid/view/View;Ljava/util/List;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    iget-object p1, p1, Ll/z8o;->c:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_4

    .line 56
    .line 57
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_3

    .line 66
    .line 67
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;

    .line 72
    .line 73
    iget-object v3, v2, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->tabs:Ljava/util/List;

    .line 74
    .line 75
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_2

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->L:Ll/m4o;

    .line 83
    .line 84
    invoke-virtual {v3, v2}, Ll/m4o;->b(Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;)Ll/e2o;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_3
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 93
    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_4
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_5

    .line 101
    .line 102
    iget-object p1, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 103
    .line 104
    check-cast p1, Landroid/view/View;

    .line 105
    .line 106
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->T5(Landroid/view/View;Ljava/util/List;)V

    .line 107
    .line 108
    .line 109
    :cond_5
    :goto_2
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_7

    .line 114
    .line 115
    iget-object p1, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 116
    .line 117
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-nez p1, :cond_6

    .line 122
    .line 123
    iget-object p1, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 124
    .line 125
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-eqz p1, :cond_7

    .line 130
    .line 131
    :cond_6
    const/4 p1, 0x1

    .line 132
    goto :goto_3

    .line 133
    :cond_7
    move p1, v0

    .line 134
    :goto_3
    invoke-virtual {p0, p2, v1, v0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->Z5(Ljava/util/List;Ljava/util/List;IZ)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public X5(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->S:Ll/y8o;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 6
    .line 7
    new-instance v1, Ll/vvk;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Ll/vvk;-><init>(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public Y5(Ll/z8o;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->D5()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance p1, Ljava/lang/NullPointerException;

    .line 8
    .line 9
    const-string v0, "LiveSetting is Null!"

    .line 10
    .line 11
    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->M5(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->loaded:Z

    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ll/z8o;->F()Landroid/util/Pair;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {p0, p1, v1, v2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->W5(Ll/z8o;Ljava/util/List;Landroid/util/Pair;)V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ll/t9o;

    .line 34
    .line 35
    invoke-direct {v2}, Ll/t9o;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    new-instance v3, Ll/u9o;

    .line 43
    .line 44
    invoke-direct {v3}, Ll/u9o;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v3}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    xor-int/2addr v4, v0

    .line 56
    if-nez v2, :cond_2

    .line 57
    .line 58
    if-eqz v3, :cond_1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    const/4 v0, 0x0

    .line 62
    :cond_2
    :goto_0
    invoke-virtual {p0, v4, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->t5(ZZ)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1, v1, v2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->R5(Ll/z8o;Ljava/util/List;Z)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final Z5(Ljava/util/List;Ljava/util/List;IZ)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;",
            "Ljava/util/List<",
            "Ll/d8o<",
            "*>;>;IZ)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/d8o;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/d8o;->I()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    add-int/2addr v2, p3

    .line 19
    iget v3, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 20
    .line 21
    xor-int/lit8 v4, p4, 0x1

    .line 22
    .line 23
    invoke-static {v1, v2, v3, v4, p1}, Ll/p1o;->c(Ll/d3q;IIZLjava/util/List;)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->f4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 5
    .line 6
    new-instance v0, Ll/s9o;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/s9o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/j0u;->J0(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/r9o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->S5(Ll/r9o;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "live_square_tab_info"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_1
    const-string p0, "p_live_recommend"

    .line 43
    .line 44
    return-object p0
.end method
