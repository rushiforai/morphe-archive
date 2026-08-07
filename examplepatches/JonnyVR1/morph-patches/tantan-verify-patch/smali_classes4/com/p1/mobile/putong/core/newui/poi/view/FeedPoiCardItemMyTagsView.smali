.class public Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->i()V

    return-void
.end method

.method public static synthetic b(Lv/VDraweeView;Lcom/p1/mobile/putong/core/data/UserTagData;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->icon:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Ll/ji80;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p1, p1, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    const/16 v1, 0xbb9

    .line 9
    .line 10
    invoke-virtual {p2, p0, v1, p1, v0}, Ll/gj40;->G(Lcom/p1/mobile/android/app/Frag;ILcom/p1/mobile/putong/data/User;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->j()V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oph;->a(Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/core/data/UserTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Landroid/view/View;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v0, Ll/kec0;->Ma:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget v0, Ll/adc0;->N5:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lv/VDraweeView;

    .line 25
    .line 26
    sget v1, Ll/adc0;->q8:I

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lv/VLinear;

    .line 33
    .line 34
    sget v1, Ll/adc0;->je:I

    .line 35
    .line 36
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lv/VText;

    .line 41
    .line 42
    sget v2, Ll/adc0;->bd:I

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Lv/VText;

    .line 49
    .line 50
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/UserTagData;->icon:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-nez v3, :cond_0

    .line 57
    .line 58
    new-instance v3, Ll/mph;

    .line 59
    .line 60
    invoke-direct {v3, v0, p2}, Ll/mph;-><init>(Lv/VDraweeView;Lcom/p1/mobile/putong/core/data/UserTagData;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 64
    .line 65
    .line 66
    :cond_0
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/UserTagData;->title:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/UserTagData;->subtitle:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/UserTagData;->subtitle:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    const/4 v0, 0x1

    .line 95
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    :goto_0
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/data/UserTagData;->highlighted:Z

    .line 99
    .line 100
    if-eqz p2, :cond_2

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    sget p2, Ll/dbc0;->An:I

    .line 107
    .line 108
    invoke-static {p0, p1, p2}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 109
    .line 110
    .line 111
    return-object p1

    .line 112
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    sget p2, Ll/dbc0;->zn:I

    .line 117
    .line 118
    invoke-static {p0, p1, p2}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 119
    .line 120
    .line 121
    return-object p1
.end method

.method public g(Lcom/p1/mobile/putong/core/data/UserTagsData;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/UserTagsData;",
            ")",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_2

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/core/data/UserTagData;

    .line 31
    .line 32
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-nez v3, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->f(Lcom/p1/mobile/putong/core/data/UserTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-object v1
.end method

.method public final h(Lcom/p1/mobile/putong/core/data/UserTagsData;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->c:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->d:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 8
    .line 9
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->setMaxLines(I)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->d:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 13
    .line 14
    new-instance v0, Ll/lph;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/lph;-><init>(Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->setCallBack(Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView$a;)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->d:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 23
    .line 24
    iput-boolean v1, p2, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->f:Z

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->g(Lcom/p1/mobile/putong/core/data/UserTagsData;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->d:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 31
    .line 32
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setTags(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->a:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;

    .line 36
    .line 37
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    xor-int/lit8 p1, p1, 0x1

    .line 42
    .line 43
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic i()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->c:Lv/VText;

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

.method public final synthetic j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->c:Lv/VText;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->c:Lv/VText;

    .line 10
    .line 11
    new-instance v1, Ll/nph;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/nph;-><init>(Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Ll/ji80;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p2, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {v1, v0, v2, v3}, Ll/gj40;->A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x3

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->h(Lcom/p1/mobile/putong/core/data/UserTagsData;I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->c:Lv/VText;

    .line 23
    .line 24
    new-instance v0, Ll/kph;

    .line 25
    .line 26
    invoke-direct {v0, p1, p2}, Ll/kph;-><init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Ll/ji80;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->b:Lv/VText;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->c:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
