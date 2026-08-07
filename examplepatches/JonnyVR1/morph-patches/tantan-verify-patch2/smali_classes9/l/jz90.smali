.class public Ll/jz90;
.super Ll/az90;
.source "SourceFile"


# instance fields
.field public L:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

.field public M:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

.field public N:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

.field public O:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

.field public P:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

.field public Q:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

.field public R:Ll/qy90;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/az90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/qy90;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/qy90;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/jz90;->R:Ll/qy90;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "movies"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "places"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "personality"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "music"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "literature"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "food"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "sports"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method


# virtual methods
.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/az90;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/az90;->v:Lv/VText;

    .line 5
    .line 6
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/az90;->w:Lv/VText_Tags;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/az90;->x:Lv/VText_Tags;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/az90;->y:Lv/VText_Tags;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/az90;->z:Lv/VText_Tags;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/az90;->A:Lv/VText_Tags;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/az90;->B:Lv/VText_Tags;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jz90;->R:Ll/qy90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1, p1}, Ll/qy90;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/jz90;->R:Ll/qy90;

    .line 16
    .line 17
    iget-object v1, v0, Ll/qy90;->a:Lv/VLinear_Dividers;

    .line 18
    .line 19
    iput-object v1, p0, Ll/az90;->u:Lv/VLinear_Dividers;

    .line 20
    .line 21
    iget-object v1, v0, Ll/qy90;->e:Lv/VText_Tags;

    .line 22
    .line 23
    iput-object v1, p0, Ll/az90;->w:Lv/VText_Tags;

    .line 24
    .line 25
    iget-object v1, v0, Ll/qy90;->i:Lv/VText_Tags;

    .line 26
    .line 27
    iput-object v1, p0, Ll/az90;->x:Lv/VText_Tags;

    .line 28
    .line 29
    iget-object v1, v0, Ll/qy90;->m:Lv/VText_Tags;

    .line 30
    .line 31
    iput-object v1, p0, Ll/az90;->y:Lv/VText_Tags;

    .line 32
    .line 33
    iget-object v1, v0, Ll/qy90;->q:Lv/VText_Tags;

    .line 34
    .line 35
    iput-object v1, p0, Ll/az90;->z:Lv/VText_Tags;

    .line 36
    .line 37
    iget-object v1, v0, Ll/qy90;->u:Lv/VText_Tags;

    .line 38
    .line 39
    iput-object v1, p0, Ll/az90;->A:Lv/VText_Tags;

    .line 40
    .line 41
    iget-object v1, v0, Ll/qy90;->y:Lv/VText_Tags;

    .line 42
    .line 43
    iput-object v1, p0, Ll/az90;->B:Lv/VText_Tags;

    .line 44
    .line 45
    iget-object v0, v0, Ll/qy90;->b:Lv/VText;

    .line 46
    .line 47
    iput-object v0, p0, Ll/az90;->v:Lv/VText;

    .line 48
    .line 49
    sget v0, Ll/adc0;->wc:I

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Landroid/widget/ImageView;

    .line 56
    .line 57
    iput-object v0, p0, Ll/az90;->D:Landroid/widget/ImageView;

    .line 58
    .line 59
    sget v0, Ll/adc0;->E8:I

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Landroid/widget/ImageView;

    .line 66
    .line 67
    iput-object v0, p0, Ll/az90;->E:Landroid/widget/ImageView;

    .line 68
    .line 69
    sget v0, Ll/adc0;->x4:I

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Landroid/widget/ImageView;

    .line 76
    .line 77
    iput-object v0, p0, Ll/az90;->F:Landroid/widget/ImageView;

    .line 78
    .line 79
    sget v0, Ll/adc0;->C8:I

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Landroid/widget/ImageView;

    .line 86
    .line 87
    iput-object v0, p0, Ll/az90;->G:Landroid/widget/ImageView;

    .line 88
    .line 89
    sget v0, Ll/adc0;->g7:I

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Landroid/widget/ImageView;

    .line 96
    .line 97
    iput-object v0, p0, Ll/az90;->H:Landroid/widget/ImageView;

    .line 98
    .line 99
    sget v0, Ll/adc0;->oa:I

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Landroid/widget/ImageView;

    .line 106
    .line 107
    iput-object v0, p0, Ll/az90;->I:Landroid/widget/ImageView;

    .line 108
    .line 109
    sget v0, Ll/adc0;->xc:I

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 116
    .line 117
    iput-object v0, p0, Ll/jz90;->L:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 118
    .line 119
    sget v0, Ll/adc0;->F8:I

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 126
    .line 127
    iput-object v0, p0, Ll/jz90;->M:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 128
    .line 129
    sget v0, Ll/adc0;->y4:I

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 136
    .line 137
    iput-object v0, p0, Ll/jz90;->N:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 138
    .line 139
    sget v0, Ll/adc0;->D8:I

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 146
    .line 147
    iput-object v0, p0, Ll/jz90;->O:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 148
    .line 149
    sget v0, Ll/adc0;->h7:I

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 156
    .line 157
    iput-object v0, p0, Ll/jz90;->P:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 158
    .line 159
    sget v0, Ll/adc0;->pa:I

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 166
    .line 167
    iput-object v0, p0, Ll/jz90;->Q:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 168
    .line 169
    iget-object v0, p0, Ll/az90;->w:Lv/VText_Tags;

    .line 170
    .line 171
    iget-object v1, p0, Ll/jz90;->R:Ll/qy90;

    .line 172
    .line 173
    iget-object v1, v1, Ll/qy90;->c:Lv/VLinear;

    .line 174
    .line 175
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Ll/az90;->x:Lv/VText_Tags;

    .line 179
    .line 180
    iget-object v1, p0, Ll/jz90;->R:Ll/qy90;

    .line 181
    .line 182
    iget-object v1, v1, Ll/qy90;->g:Lv/VLinear;

    .line 183
    .line 184
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Ll/az90;->y:Lv/VText_Tags;

    .line 188
    .line 189
    iget-object v1, p0, Ll/jz90;->R:Ll/qy90;

    .line 190
    .line 191
    iget-object v1, v1, Ll/qy90;->k:Lv/VLinear;

    .line 192
    .line 193
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Ll/az90;->B:Lv/VText_Tags;

    .line 197
    .line 198
    iget-object v1, p0, Ll/jz90;->R:Ll/qy90;

    .line 199
    .line 200
    iget-object v1, v1, Ll/qy90;->w:Lv/VLinear;

    .line 201
    .line 202
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 203
    .line 204
    .line 205
    iget-object v0, p0, Ll/az90;->A:Lv/VText_Tags;

    .line 206
    .line 207
    iget-object v1, p0, Ll/jz90;->R:Ll/qy90;

    .line 208
    .line 209
    iget-object v1, v1, Ll/qy90;->s:Lv/VLinear;

    .line 210
    .line 211
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Ll/az90;->z:Lv/VText_Tags;

    .line 215
    .line 216
    iget-object v1, p0, Ll/jz90;->R:Ll/qy90;

    .line 217
    .line 218
    iget-object v1, v1, Ll/qy90;->o:Lv/VLinear;

    .line 219
    .line 220
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 221
    .line 222
    .line 223
    return-object p1
.end method

.method public t()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/az90;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v1}, Ll/t3m;->me()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz v0, :cond_a

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    goto/16 :goto_7

    .line 25
    .line 26
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 27
    .line 28
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 29
    .line 30
    new-instance v3, Ll/cz90;

    .line 31
    .line 32
    invoke-direct {v3, v1}, Ll/cz90;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v3, p0, Ll/jz90;->R:Ll/qy90;

    .line 40
    .line 41
    iget-object v3, v3, Ll/qy90;->b:Lv/VText;

    .line 42
    .line 43
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-nez v3, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-interface {v3}, Ll/t3m;->P1()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object v3, p0, Ll/jz90;->R:Ll/qy90;

    .line 66
    .line 67
    iget-object v3, v3, Ll/qy90;->b:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-interface {v4}, Ll/nol;->act()Landroid/app/Activity;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    check-cast v4, Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    sget v5, Lcom/p1/mobile/putong/core/R$string;->wl:I

    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v4, v5, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    :goto_0
    iget-object v2, p0, Ll/jz90;->R:Ll/qy90;

    .line 102
    .line 103
    iget-object v2, v2, Ll/qy90;->b:Lv/VText;

    .line 104
    .line 105
    sget v3, Lcom/p1/mobile/putong/core/R$string;->El:I

    .line 106
    .line 107
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 108
    .line 109
    .line 110
    :goto_1
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-interface {v2}, Ll/t3m;->P1()Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-nez v2, :cond_9

    .line 119
    .line 120
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 121
    .line 122
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 123
    .line 124
    new-instance v3, Ll/dz90;

    .line 125
    .line 126
    invoke-direct {v3, v1}, Ll/dz90;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    iget-object v3, p0, Ll/az90;->D:Landroid/widget/ImageView;

    .line 138
    .line 139
    if-eqz v2, :cond_3

    .line 140
    .line 141
    sget v2, Ll/dbc0;->Rn:I

    .line 142
    .line 143
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 144
    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_3
    sget v2, Ll/dbc0;->Qn:I

    .line 148
    .line 149
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 150
    .line 151
    .line 152
    :goto_2
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 153
    .line 154
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 155
    .line 156
    new-instance v3, Ll/ez90;

    .line 157
    .line 158
    invoke-direct {v3, v1}, Ll/ez90;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 159
    .line 160
    .line 161
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    iget-object v3, p0, Ll/az90;->E:Landroid/widget/ImageView;

    .line 170
    .line 171
    if-eqz v2, :cond_4

    .line 172
    .line 173
    sget v2, Ll/dbc0;->un:I

    .line 174
    .line 175
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 176
    .line 177
    .line 178
    goto :goto_3

    .line 179
    :cond_4
    sget v2, Ll/dbc0;->tn:I

    .line 180
    .line 181
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 182
    .line 183
    .line 184
    :goto_3
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 185
    .line 186
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 187
    .line 188
    new-instance v3, Ll/fz90;

    .line 189
    .line 190
    invoke-direct {v3, v1}, Ll/fz90;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 191
    .line 192
    .line 193
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 198
    .line 199
    .line 200
    move-result v2

    .line 201
    iget-object v3, p0, Ll/az90;->F:Landroid/widget/ImageView;

    .line 202
    .line 203
    if-eqz v2, :cond_5

    .line 204
    .line 205
    sget v2, Ll/dbc0;->Lm:I

    .line 206
    .line 207
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 208
    .line 209
    .line 210
    goto :goto_4

    .line 211
    :cond_5
    sget v2, Ll/dbc0;->Km:I

    .line 212
    .line 213
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 214
    .line 215
    .line 216
    :goto_4
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 217
    .line 218
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 219
    .line 220
    new-instance v3, Ll/gz90;

    .line 221
    .line 222
    invoke-direct {v3, v1}, Ll/gz90;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 223
    .line 224
    .line 225
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 230
    .line 231
    .line 232
    move-result v2

    .line 233
    iget-object v3, p0, Ll/az90;->G:Landroid/widget/ImageView;

    .line 234
    .line 235
    if-eqz v2, :cond_6

    .line 236
    .line 237
    sget v2, Ll/dbc0;->sn:I

    .line 238
    .line 239
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 240
    .line 241
    .line 242
    goto :goto_5

    .line 243
    :cond_6
    sget v2, Ll/dbc0;->rn:I

    .line 244
    .line 245
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 246
    .line 247
    .line 248
    :goto_5
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 249
    .line 250
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 251
    .line 252
    new-instance v3, Ll/hz90;

    .line 253
    .line 254
    invoke-direct {v3, v1}, Ll/hz90;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 255
    .line 256
    .line 257
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 258
    .line 259
    .line 260
    move-result-object v2

    .line 261
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 262
    .line 263
    .line 264
    move-result v2

    .line 265
    iget-object v3, p0, Ll/az90;->H:Landroid/widget/ImageView;

    .line 266
    .line 267
    if-eqz v2, :cond_7

    .line 268
    .line 269
    sget v2, Ll/dbc0;->Mn:I

    .line 270
    .line 271
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 272
    .line 273
    .line 274
    goto :goto_6

    .line 275
    :cond_7
    sget v2, Ll/dbc0;->Ln:I

    .line 276
    .line 277
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 278
    .line 279
    .line 280
    :goto_6
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 281
    .line 282
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 283
    .line 284
    new-instance v2, Ll/iz90;

    .line 285
    .line 286
    invoke-direct {v2, v1}, Ll/iz90;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 287
    .line 288
    .line 289
    invoke-static {v0, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    iget-object p0, p0, Ll/az90;->I:Landroid/widget/ImageView;

    .line 298
    .line 299
    if-eqz v0, :cond_8

    .line 300
    .line 301
    sget v0, Ll/dbc0;->Vn:I

    .line 302
    .line 303
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 304
    .line 305
    .line 306
    return-void

    .line 307
    :cond_8
    sget v0, Ll/dbc0;->Un:I

    .line 308
    .line 309
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 310
    .line 311
    .line 312
    return-void

    .line 313
    :cond_9
    iget-object v0, p0, Ll/az90;->D:Landroid/widget/ImageView;

    .line 314
    .line 315
    sget v1, Ll/dbc0;->Rn:I

    .line 316
    .line 317
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 318
    .line 319
    .line 320
    iget-object v0, p0, Ll/az90;->E:Landroid/widget/ImageView;

    .line 321
    .line 322
    sget v1, Ll/dbc0;->un:I

    .line 323
    .line 324
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 325
    .line 326
    .line 327
    iget-object v0, p0, Ll/az90;->G:Landroid/widget/ImageView;

    .line 328
    .line 329
    sget v1, Ll/dbc0;->sn:I

    .line 330
    .line 331
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 332
    .line 333
    .line 334
    iget-object v0, p0, Ll/az90;->F:Landroid/widget/ImageView;

    .line 335
    .line 336
    sget v1, Ll/dbc0;->Lm:I

    .line 337
    .line 338
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 339
    .line 340
    .line 341
    iget-object v0, p0, Ll/az90;->H:Landroid/widget/ImageView;

    .line 342
    .line 343
    sget v1, Ll/dbc0;->Mn:I

    .line 344
    .line 345
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 346
    .line 347
    .line 348
    iget-object p0, p0, Ll/az90;->I:Landroid/widget/ImageView;

    .line 349
    .line 350
    sget v0, Ll/dbc0;->Vn:I

    .line 351
    .line 352
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 353
    .line 354
    .line 355
    :cond_a
    :goto_7
    return-void
.end method
