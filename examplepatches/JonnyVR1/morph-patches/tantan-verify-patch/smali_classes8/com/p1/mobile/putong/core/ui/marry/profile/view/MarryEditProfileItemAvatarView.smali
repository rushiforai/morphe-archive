.class public Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Ll/xyl;
.implements Ll/oyl;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

.field public b:I

.field public c:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation
.end field

.field public e:Landroid/view/View;

.field public f:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->b:I

    .line 6
    .line 7
    const/4 p1, 0x6

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->f:I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->b:I

    const/4 p1, 0x6

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->f:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->b:I

    const/4 p1, 0x6

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->f:I

    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->z(Ljava/lang/Boolean;)V

    return-void
.end method

.method private r()V
    .locals 5

    .line 1
    sget v0, Ll/gdc0;->I:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 10
    .line 11
    sget v0, Ll/gdc0;->b:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->e:Landroid/view/View;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardsCrop(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setSlideWithoutPress(Z)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->X5()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    const/16 v0, 0x9

    .line 46
    .line 47
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->f:I

    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 50
    .line 51
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 52
    .line 53
    .line 54
    :cond_0
    move v0, v2

    .line 55
    :goto_0
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->f:I

    .line 56
    .line 57
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 58
    .line 59
    if-ge v0, v3, :cond_5

    .line 60
    .line 61
    invoke-virtual {v4, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 66
    .line 67
    const/4 v4, 0x0

    .line 68
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C1(Lcom/p1/mobile/putong/data/Media;)V

    .line 69
    .line 70
    .line 71
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 72
    .line 73
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 78
    .line 79
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->MARRY_AVATAR:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 80
    .line 81
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCardType(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;)V

    .line 82
    .line 83
    .line 84
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 85
    .line 86
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 91
    .line 92
    invoke-virtual {v3, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->setMediaOperation(Ll/xyl;)V

    .line 93
    .line 94
    .line 95
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 96
    .line 97
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 102
    .line 103
    new-instance v4, Ll/v0x;

    .line 104
    .line 105
    invoke-direct {v4, p0}, Ll/v0x;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setChangeAction(Ll/a30;)V

    .line 109
    .line 110
    .line 111
    invoke-static {}, Ll/xra;->j()Z

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    if-eqz v3, :cond_1

    .line 116
    .line 117
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 118
    .line 119
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 124
    .line 125
    const-string v4, "p_edit_profile_view"

    .line 126
    .line 127
    invoke-virtual {v3, v0, v4}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E1(ILjava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 131
    .line 132
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 137
    .line 138
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I0(I)V

    .line 139
    .line 140
    .line 141
    invoke-static {}, Ll/xra;->q()Z

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    if-eqz v3, :cond_4

    .line 146
    .line 147
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 148
    .line 149
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 154
    .line 155
    if-lez v0, :cond_2

    .line 156
    .line 157
    move v4, v1

    .line 158
    goto :goto_1

    .line 159
    :cond_2
    move v4, v2

    .line 160
    :goto_1
    iput-boolean v4, v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n:Z

    .line 161
    .line 162
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 163
    .line 164
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 169
    .line 170
    if-nez v0, :cond_3

    .line 171
    .line 172
    move v4, v1

    .line 173
    goto :goto_2

    .line 174
    :cond_3
    move v4, v2

    .line 175
    :goto_2
    iput-boolean v4, v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->p:Z

    .line 176
    .line 177
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_5
    new-instance v0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView$a;

    .line 181
    .line 182
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView$a;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v4, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setReorderCardsCallback(Ll/t4m;)V

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 189
    .line 190
    new-instance v1, Ll/w0x;

    .line 191
    .line 192
    invoke-direct {v1, p0}, Ll/w0x;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setOnDraggingListener(Ll/y20;)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->w(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->E(Z)V

    return-void
.end method

.method private synthetic z(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->e:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public B(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "preprocessed"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 12
    .line 13
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 18
    .line 19
    new-instance p1, Ll/sim;

    .line 20
    .line 21
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {p1, v1}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 31
    .line 32
    iget-object p1, p1, Ll/sim;->d:[I

    .line 33
    .line 34
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 35
    .line 36
    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 38
    .line 39
    const-string p1, "image/jpeg"

    .line 40
    .line 41
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 42
    .line 43
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->b:I

    .line 44
    .line 45
    if-gez p1, :cond_0

    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->w1(Lcom/p1/mobile/putong/data/Picture;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public C(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    const/16 v0, 0x312

    .line 2
    .line 3
    if-ne p1, v0, :cond_2

    .line 4
    .line 5
    const/4 p1, -0x1

    .line 6
    if-ne p2, p1, :cond_2

    .line 7
    .line 8
    if-eqz p3, :cond_2

    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-nez p2, :cond_2

    .line 23
    .line 24
    const/4 p2, 0x0

    .line 25
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->b:I

    .line 32
    .line 33
    if-gez p2, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    instance-of p3, p1, Lcom/p1/mobile/putong/data/Video;

    .line 37
    .line 38
    if-eqz p3, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 41
    .line 42
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 47
    .line 48
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->z1(Lcom/p1/mobile/putong/data/Video;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    instance-of p3, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 55
    .line 56
    if-eqz p3, :cond_2

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 59
    .line 60
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 65
    .line 66
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->w1(Lcom/p1/mobile/putong/data/Picture;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_0
    return-void
.end method

.method public final E(Z)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->f:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    if-nez p1, :cond_2

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->d:Ll/y20;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->d:Ll/y20;

    .line 44
    .line 45
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :goto_0
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->f:I

    .line 5
    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-lt v0, v2, :cond_0

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 29
    .line 30
    :goto_1
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C1(Lcom/p1/mobile/putong/data/Media;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J1()V

    .line 42
    .line 43
    .line 44
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public f2(ILjava/lang/String;)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->b:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {v0, p0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->j6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/16 p2, 0x6000

    .line 24
    .line 25
    invoke-virtual {p1, p0, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public getAllMedia()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->f:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-object v0
.end method

.method public getClickView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getItemType()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->c:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getSelfActions()Ljava/util/List;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/xyl;->getSelfActions()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public n0(IZZZ)V
    .locals 5

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->b:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    const/16 p2, 0x312

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object p4

    .line 49
    invoke-virtual {p3, p4, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 50
    .line 51
    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget p2, Ll/z7c0;->h:I

    .line 57
    .line 58
    invoke-virtual {p0, p2, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    const/high16 p3, 0x42200000    # 40.0f

    .line 63
    .line 64
    const v1, 0x3f4ccccd    # 0.8f

    .line 65
    .line 66
    .line 67
    if-eqz p4, :cond_1

    .line 68
    .line 69
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object p4

    .line 73
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    invoke-virtual {v4, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v4, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-static {}, Ll/bnl0;->y0()I

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result p3

    .line 101
    sub-int/2addr v4, p3

    .line 102
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 103
    .line 104
    .line 105
    move-result-object p3

    .line 106
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    invoke-virtual {v3, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Mm(Lcom/p1/mobile/android/app/Act;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->setCroppingNewStyle(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 135
    .line 136
    .line 137
    move-result-object p3

    .line 138
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 139
    .line 140
    .line 141
    move-result-object p3

    .line 142
    invoke-static {v2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 143
    .line 144
    .line 145
    move-result-object p3

    .line 146
    invoke-virtual {p4, p3, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 147
    .line 148
    .line 149
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    sget p2, Ll/z7c0;->h:I

    .line 154
    .line 155
    invoke-virtual {p0, p2, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_1
    invoke-static {}, Ll/xra;->n()Z

    .line 160
    .line 161
    .line 162
    move-result p4

    .line 163
    if-eqz p4, :cond_2

    .line 164
    .line 165
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 166
    .line 167
    .line 168
    move-result-object p4

    .line 169
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    invoke-virtual {v4, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    invoke-virtual {v4, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-static {}, Ll/bnl0;->y0()I

    .line 190
    .line 191
    .line 192
    move-result v4

    .line 193
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 194
    .line 195
    .line 196
    move-result p3

    .line 197
    sub-int/2addr v4, p3

    .line 198
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 199
    .line 200
    .line 201
    move-result-object p3

    .line 202
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 203
    .line 204
    .line 205
    move-result-object p3

    .line 206
    invoke-virtual {v3, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 207
    .line 208
    .line 209
    move-result-object p3

    .line 210
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->canClickSubmitInPreviewWhenNoSelectedMedia()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    invoke-virtual {p3, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 227
    .line 228
    .line 229
    move-result-object p3

    .line 230
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needAllSelectedMediaPreview()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 231
    .line 232
    .line 233
    move-result-object p3

    .line 234
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 235
    .line 236
    .line 237
    move-result-object p3

    .line 238
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 239
    .line 240
    .line 241
    move-result-object p3

    .line 242
    invoke-static {v2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 243
    .line 244
    .line 245
    move-result-object p3

    .line 246
    invoke-virtual {p4, p3, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 247
    .line 248
    .line 249
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    sget p2, Ll/z7c0;->h:I

    .line 254
    .line 255
    invoke-virtual {p0, p2, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 256
    .line 257
    .line 258
    return-void

    .line 259
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 264
    .line 265
    .line 266
    move-result-object p3

    .line 267
    invoke-virtual {p3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 268
    .line 269
    .line 270
    move-result-object p3

    .line 271
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->act()Lcom/p1/mobile/android/app/Act;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    invoke-interface {p3, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ge(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    invoke-virtual {p1, p0, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 280
    .line 281
    .line 282
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/sec0;->J:I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 20
    .line 21
    const/4 v2, -0x1

    .line 22
    const/4 v3, -0x2

    .line 23
    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->r()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public bridge synthetic setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/oyl;->setContent(Ljava/lang/String;)V

    return-void
.end method

.method public setMediaChangeCallback(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->d:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/oyl;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->c:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;->E(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
