.class public Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lv/VText;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Landroid/view/View;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Landroid/view/View;

.field public o:Lcom/p1/mobile/putong/core/data/LikedUser;


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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Ll/y20;Lcom/p1/mobile/putong/core/data/LikedUser;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->g(Ll/y20;Lcom/p1/mobile/putong/core/data/LikedUser;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Ll/y20;Lcom/p1/mobile/putong/core/data/LikedUser;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->f(Ll/y20;Lcom/p1/mobile/putong/core/data/LikedUser;Landroid/view/View;)V

    return-void
.end method

.method public static e(I)Ljava/lang/String;
    .locals 2

    .line 1
    const/16 v0, 0x64

    .line 2
    .line 3
    const-string v1, "1km"

    .line 4
    .line 5
    if-gt p0, v0, :cond_0

    .line 6
    .line 7
    return-object v1

    .line 8
    :cond_0
    const/16 v0, 0x3e8

    .line 9
    .line 10
    if-ge p0, v0, :cond_1

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_1
    const v1, 0x186a0

    .line 14
    .line 15
    .line 16
    if-ge p0, v1, :cond_2

    .line 17
    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    div-int/2addr p0, v0

    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, "km"

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    const-string p0, "99+km"

    .line 38
    .line 39
    return-object p0
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ghr;->a(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic f(Ll/y20;Lcom/p1/mobile/putong/core/data/LikedUser;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object p3, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-eq p0, p3, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic g(Ll/y20;Lcom/p1/mobile/putong/core/data/LikedUser;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object p3, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-eq p0, p3, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 15
    .line 16
    const-string p2, "superliked"

    .line 17
    .line 18
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/y20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->o:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 2
    .line 3
    new-instance v0, Ll/ehr;

    .line 4
    .line 5
    invoke-direct {v0, p0, p4, p1}, Ll/ehr;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Ll/y20;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->h:Lv/VImage;

    .line 12
    .line 13
    new-instance v0, Ll/fhr;

    .line 14
    .line 15
    invoke-direct {v0, p0, p5, p1}, Ll/fhr;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Ll/y20;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p4, v0}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p2}, Ll/wj90;->c(Lcom/p1/mobile/putong/data/User;)Z

    .line 22
    .line 23
    .line 24
    move-result p4

    .line 25
    const/4 p5, 0x0

    .line 26
    if-eqz p4, :cond_0

    .line 27
    .line 28
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->a:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v2, 0x3

    .line 45
    const/16 v3, 0x64

    .line 46
    .line 47
    invoke-virtual {p4, v0, v1, v2, v3}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->a:Lv/VDraweeView;

    .line 54
    .line 55
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {p4, v0, v1, p5}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 68
    .line 69
    .line 70
    :goto_0
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->n:Landroid/view/View;

    .line 71
    .line 72
    invoke-static {p4, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->i:Lv/VImage;

    .line 76
    .line 77
    invoke-static {p4, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 81
    .line 82
    if-eqz p3, :cond_1

    .line 83
    .line 84
    invoke-static {p4, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->k:Lv/VText;

    .line 88
    .line 89
    invoke-static {p1, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->m:Lv/VText;

    .line 93
    .line 94
    invoke-static {p1, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->j:Lv/VText;

    .line 98
    .line 99
    invoke-static {p0, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_1
    const/4 p3, 0x1

    .line 104
    invoke-static {p4, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->m:Lv/VText;

    .line 108
    .line 109
    invoke-static {p4, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->m:Lv/VText;

    .line 113
    .line 114
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 115
    .line 116
    const-string v1, "disliked"

    .line 117
    .line 118
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_2

    .line 123
    .line 124
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->y:I

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_2
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->z:I

    .line 128
    .line 129
    :goto_1
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(I)V

    .line 130
    .line 131
    .line 132
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->e:Lv/VText;

    .line 133
    .line 134
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 135
    .line 136
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->f:Landroid/view/View;

    .line 144
    .line 145
    invoke-static {p4, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->g:Lv/VText;

    .line 149
    .line 150
    invoke-static {p4, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 151
    .line 152
    .line 153
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->g:Lv/VText;

    .line 154
    .line 155
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 156
    .line 157
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 158
    .line 159
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->e(I)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 167
    .line 168
    const-string v0, "superliked"

    .line 169
    .line 170
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 171
    .line 172
    .line 173
    move-result p4

    .line 174
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->m:Lv/VText;

    .line 175
    .line 176
    if-eqz p4, :cond_4

    .line 177
    .line 178
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 179
    .line 180
    .line 181
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->k:Lv/VText;

    .line 182
    .line 183
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 184
    .line 185
    .line 186
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->sf()Z

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    const/4 p4, 0x2

    .line 199
    if-eqz p2, :cond_3

    .line 200
    .line 201
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 202
    .line 203
    .line 204
    move-result-object p2

    .line 205
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 206
    .line 207
    .line 208
    move-result-object p2

    .line 209
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 210
    .line 211
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RelationshipExt;->sendSuperLikedNum:Ljava/lang/String;

    .line 212
    .line 213
    invoke-interface {p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Hl(Ljava/lang/String;)I

    .line 214
    .line 215
    .line 216
    move-result p2

    .line 217
    if-le p2, p3, :cond_3

    .line 218
    .line 219
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->k:Lv/VText;

    .line 220
    .line 221
    invoke-static {p4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 222
    .line 223
    .line 224
    move-result-object p4

    .line 225
    invoke-virtual {p2, p4, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 226
    .line 227
    .line 228
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->k:Lv/VText;

    .line 229
    .line 230
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 231
    .line 232
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RelationshipExt;->sendSuperLikedNum:Ljava/lang/String;

    .line 233
    .line 234
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    const-string p4, "\u8d85\u7ea7\u559c\u6b22x%s"

    .line 239
    .line 240
    invoke-static {p4, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 245
    .line 246
    .line 247
    goto :goto_2

    .line 248
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->k:Lv/VText;

    .line 249
    .line 250
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 251
    .line 252
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->A:I

    .line 253
    .line 254
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p2

    .line 258
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 259
    .line 260
    .line 261
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->k:Lv/VText;

    .line 262
    .line 263
    invoke-static {p4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 264
    .line 265
    .line 266
    move-result-object p2

    .line 267
    invoke-virtual {p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 268
    .line 269
    .line 270
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->c:Lv/VText;

    .line 271
    .line 272
    invoke-static {p1, p5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 273
    .line 274
    .line 275
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->h:Lv/VImage;

    .line 276
    .line 277
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 278
    .line 279
    .line 280
    move-result-object p2

    .line 281
    invoke-interface {p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 282
    .line 283
    .line 284
    move-result p2

    .line 285
    xor-int/2addr p2, p3

    .line 286
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 287
    .line 288
    .line 289
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->l:Lv/VText;

    .line 290
    .line 291
    invoke-static {p1, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 292
    .line 293
    .line 294
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->h:Lv/VImage;

    .line 295
    .line 296
    sget p2, Ll/gbc0;->r0:I

    .line 297
    .line 298
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 299
    .line 300
    .line 301
    goto :goto_4

    .line 302
    :cond_4
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 303
    .line 304
    .line 305
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->l:Lv/VText;

    .line 306
    .line 307
    invoke-static {p1, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 308
    .line 309
    .line 310
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->h:Lv/VImage;

    .line 311
    .line 312
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isHideActiveFromSVip()Z

    .line 316
    .line 317
    .line 318
    move-result p1

    .line 319
    if-nez p1, :cond_5

    .line 320
    .line 321
    invoke-static {}, Ll/pzi0;->o()J

    .line 322
    .line 323
    .line 324
    move-result-wide v0

    .line 325
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 326
    .line 327
    iget-wide p1, p1, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 328
    .line 329
    invoke-static {p1, p2}, Ljava/lang/Math;->round(D)J

    .line 330
    .line 331
    .line 332
    move-result-wide p1

    .line 333
    sub-long/2addr v0, p1

    .line 334
    const-wide/32 p1, 0x2bf20

    .line 335
    .line 336
    .line 337
    cmp-long p1, v0, p1

    .line 338
    .line 339
    if-gtz p1, :cond_5

    .line 340
    .line 341
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->c:Lv/VText;

    .line 342
    .line 343
    invoke-static {p1, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 344
    .line 345
    .line 346
    goto :goto_3

    .line 347
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->c:Lv/VText;

    .line 348
    .line 349
    invoke-static {p1, p5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 350
    .line 351
    .line 352
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->k:Lv/VText;

    .line 353
    .line 354
    invoke-static {p1, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 355
    .line 356
    .line 357
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->h:Lv/VImage;

    .line 358
    .line 359
    sget p2, Ll/gbc0;->s0:I

    .line 360
    .line 361
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 362
    .line 363
    .line 364
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 365
    .line 366
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 367
    .line 368
    .line 369
    move-result-object p0

    .line 370
    sget p2, Ll/gbc0;->q0:I

    .line 371
    .line 372
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 373
    .line 374
    .line 375
    move-result-object p0

    .line 376
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 377
    .line 378
    .line 379
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 14
    .line 15
    invoke-static {}, Ll/bnl0;->y0()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    div-int/lit8 v1, v1, 0x2

    .line 20
    .line 21
    sget v2, Ll/qa00;->j:I

    .line 22
    .line 23
    sub-int/2addr v1, v2

    .line 24
    int-to-double v1, v1

    .line 25
    const-wide v3, 0x3ff547ae147ae148L    # 1.33

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    mul-double/2addr v1, v3

    .line 31
    const-wide v3, 0x3fd851eb80000000L    # 0.3799999952316284

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    mul-double/2addr v1, v3

    .line 37
    double-to-int v1, v1

    .line 38
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 39
    .line 40
    if-eq v2, v1, :cond_0

    .line 41
    .line 42
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-double v0, v0

    .line 6
    const-wide v2, 0x3ff547ae147ae148L    # 1.33

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    mul-double/2addr v0, v2

    .line 12
    double-to-int v0, v0

    .line 13
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
