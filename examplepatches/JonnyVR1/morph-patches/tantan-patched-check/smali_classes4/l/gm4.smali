.class public Ll/gm4;
.super Ll/h4;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/rql;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/h4;-><init>(Ll/rql;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/gm4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gm4;->l(Landroid/view/View;)V

    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Ll/r130;->a:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    sget-object v0, Ll/r130;->a:Ll/jxd0;

    .line 14
    .line 15
    xor-int/lit8 p1, p1, 0x1

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    sget-object p1, Ll/r130;->a:Ll/jxd0;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-virtual {p0, p1}, Ll/gm4;->m(Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/h4;->c:Ll/rql;

    .line 40
    .line 41
    sget-object p1, Ll/r130;->a:Ll/jxd0;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    xor-int/lit8 p1, p1, 0x1

    .line 54
    .line 55
    invoke-interface {p0, p1}, Ll/rql;->setMomentCardSilent(Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/rql;->q()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 15
    .line 16
    invoke-interface {v0}, Ll/rql;->q()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/h4;->c:Ll/rql;

    .line 29
    .line 30
    invoke-interface {p0}, Ll/rql;->q()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 41
    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_0
    return v1
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "mute_video"

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/rql;->E()Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/rql;->E()Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 23
    .line 24
    invoke-interface {v0}, Ll/rql;->Z()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 32
    .line 33
    invoke-interface {v0}, Ll/rql;->m0()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 41
    .line 42
    invoke-interface {v0}, Ll/rql;->t0()Lv/VText;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 50
    .line 51
    invoke-interface {v0}, Ll/rql;->o()Landroid/widget/ImageView;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 62
    .line 63
    invoke-interface {v0}, Ll/rql;->o()Landroid/widget/ImageView;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    :cond_2
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 71
    .line 72
    invoke-interface {v0}, Ll/rql;->w()Lv/VDraweeView;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 83
    .line 84
    invoke-interface {v0}, Ll/rql;->w()Lv/VDraweeView;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    :cond_3
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 92
    .line 93
    invoke-interface {v0}, Ll/rql;->o0()Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 101
    .line 102
    invoke-interface {v0}, Ll/rql;->z0()Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 110
    .line 111
    invoke-interface {v0}, Ll/rql;->i0()V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 115
    .line 116
    invoke-interface {v0}, Ll/rql;->q()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-lez v0, :cond_4

    .line 127
    .line 128
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 129
    .line 130
    invoke-interface {v0}, Ll/rql;->q()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 135
    .line 136
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 141
    .line 142
    if-eqz v0, :cond_4

    .line 143
    .line 144
    const/4 v1, 0x1

    .line 145
    :cond_4
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 146
    .line 147
    invoke-interface {v0}, Ll/rql;->y0()Lv/VImage;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    sget-object v0, Ll/r130;->a:Ll/jxd0;

    .line 155
    .line 156
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Ljava/lang/Boolean;

    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    invoke-virtual {p0, v0}, Ll/gm4;->m(Z)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 170
    .line 171
    invoke-interface {v0}, Ll/rql;->y0()Lv/VImage;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    new-instance v2, Ll/fm4;

    .line 176
    .line 177
    invoke-direct {v2, p0}, Ll/fm4;-><init>(Ll/gm4;)V

    .line 178
    .line 179
    .line 180
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 181
    .line 182
    .line 183
    return v1
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h4;->c:Ll/rql;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/rql;->y0()Lv/VImage;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p1, Ll/dbc0;->Cf:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-interface {p0}, Ll/rql;->y0()Lv/VImage;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget p1, Ll/dbc0;->Af:I

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
