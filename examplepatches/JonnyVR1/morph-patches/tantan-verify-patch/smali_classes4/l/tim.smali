.class public Ll/tim;
.super Ll/h11;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tim$c;
    }
.end annotation


# static fields
.field public static final h:I


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VLinear;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

.field public g:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/kec0;->V6:I

    .line 2
    .line 3
    sput v0, Ll/tim;->h:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/h11;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/tim;->g:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/tim;->c(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Lcom/facebook/drawee/generic/RoundingParams;

    .line 11
    .line 12
    invoke-direct {p1}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 13
    .line 14
    .line 15
    const/high16 v1, 0x41200000    # 10.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    invoke-virtual {p1, v1}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/tim;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/wlj;

    .line 34
    .line 35
    invoke-virtual {v1, p1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/tim;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Ll/wlj;

    .line 47
    .line 48
    sget v1, Ll/dbc0;->V0:I

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Ll/wlj;->z(I)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/tim;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 54
    .line 55
    const/4 p1, 0x1

    .line 56
    invoke-virtual {p0, p1, v0, p1, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->L(ZZZZ)V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 8
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p2, :cond_7

    .line 5
    .line 6
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 7
    .line 8
    if-eqz p2, :cond_7

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 11
    .line 12
    if-eqz p2, :cond_7

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->lifeMoment:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-nez p2, :cond_7

    .line 21
    .line 22
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->lifeMoment:Ljava/util/List;

    .line 29
    .line 30
    new-instance v1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    const-string v3, "http"

    .line 44
    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_0

    .line 58
    .line 59
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 68
    .line 69
    if-eqz p2, :cond_2

    .line 70
    .line 71
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    const/4 p2, 0x1

    .line 76
    invoke-static {v2, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    move v4, v0

    .line 89
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    if-eqz v5, :cond_4

    .line 94
    .line 95
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    check-cast v5, Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    const-string v7, "normal"

    .line 106
    .line 107
    invoke-static {v7}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 108
    .line 109
    .line 110
    move-result-object v7

    .line 111
    iput-object v7, v6, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 112
    .line 113
    iput-object v5, v6, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 114
    .line 115
    const-string v7, "image/jpeg"

    .line 116
    .line 117
    iput-object v7, v6, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 118
    .line 119
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    invoke-virtual {v5, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    if-nez v5, :cond_3

    .line 127
    .line 128
    move v4, p2

    .line 129
    goto :goto_1

    .line 130
    :cond_4
    if-eqz v4, :cond_5

    .line 131
    .line 132
    new-instance v1, Ljava/lang/RuntimeException;

    .line 133
    .line 134
    new-instance v3, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    const-string v4, "AbnormalURL_RuntimeException:user.id:"

    .line 137
    .line 138
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-direct {v1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 154
    .line 155
    .line 156
    :cond_5
    iget-object p1, p0, Ll/tim;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 157
    .line 158
    iput-boolean p2, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->M:Z

    .line 159
    .line 160
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 165
    .line 166
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 167
    .line 168
    .line 169
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    iget-object v1, p0, Ll/tim;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 174
    .line 175
    if-le p1, p2, :cond_6

    .line 176
    .line 177
    invoke-static {v1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 178
    .line 179
    .line 180
    iget-object p1, p0, Ll/tim;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 181
    .line 182
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 183
    .line 184
    .line 185
    move-result p2

    .line 186
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Ll/tim;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 190
    .line 191
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setSelectedIndex(I)V

    .line 192
    .line 193
    .line 194
    goto :goto_2

    .line 195
    :cond_6
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 196
    .line 197
    .line 198
    :goto_2
    iget-object p1, p0, Ll/tim;->c:Landroid/view/View;

    .line 199
    .line 200
    new-instance p2, Ll/tim$a;

    .line 201
    .line 202
    invoke-direct {p2, p0, v2}, Ll/tim$a;-><init>(Ll/tim;Ljava/util/List;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Ll/tim;->d:Landroid/view/View;

    .line 209
    .line 210
    new-instance p2, Ll/tim$b;

    .line 211
    .line 212
    invoke-direct {p2, p0, v2}, Ll/tim$b;-><init>(Ll/tim;Ljava/util/List;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :cond_7
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 220
    .line 221
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 222
    .line 223
    .line 224
    return-void
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/uim;->a(Ll/tim;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
