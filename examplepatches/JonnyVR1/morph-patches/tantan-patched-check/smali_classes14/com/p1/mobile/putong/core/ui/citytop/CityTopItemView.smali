.class public Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/citytop/b$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Lcom/p1/mobile/putong/core/ui/citytop/b$b<",
        "Lcom/p1/mobile/putong/core/data/Greeting;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VImage;

.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Landroid/widget/RelativeLayout;

.field public g:Lv/VText;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lcom/p1/mobile/putong/core/data/Greeting;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->g(Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;Ll/y20;Lcom/p1/mobile/putong/core/data/Greeting;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->f(Ll/y20;Lcom/p1/mobile/putong/core/data/Greeting;Landroid/view/View;)V

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
    invoke-static {p0, p1}, Ll/v75;->a(Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;Landroid/view/View;)V

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

.method public final synthetic f(Ll/y20;Lcom/p1/mobile/putong/core/data/Greeting;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    const-string v0, "e_city_cover_received_like_user_card"

    .line 10
    .line 11
    invoke-static {v0, p3}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object p3, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 23
    .line 24
    if-eq p0, p3, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic g(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->d()Lcom/p1/mobile/android/app/Act;

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
    sget-object p2, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-eq p0, p2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public getWrapperData()Lcom/p1/mobile/putong/core/data/Greeting;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->m:Lcom/p1/mobile/putong/core/data/Greeting;

    return-object p0
.end method

.method public bridge synthetic getWrapperData()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->getWrapperData()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;Ll/y20;Ll/x20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "e_city_cover_received_like_user_card"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->m:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 15
    .line 16
    new-instance v0, Ll/t75;

    .line 17
    .line 18
    invoke-direct {v0, p0, p4, p3}, Ll/t75;-><init>(Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;Ll/y20;Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p0, v0}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->i:Lv/VImage;

    .line 25
    .line 26
    new-instance v0, Ll/u75;

    .line 27
    .line 28
    invoke-direct {v0, p0, p5}, Ll/u75;-><init>(Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p4, v0}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 35
    .line 36
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->a:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {p4, p5, v0, v1}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->b:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->c:Lv/VImage;

    .line 57
    .line 58
    invoke-virtual {p1, p4, p5}, Lcom/p1/mobile/putong/data/User;->showPicVerificationIcon(Landroid/view/View;Lv/VImage;)V

    .line 59
    .line 60
    .line 61
    new-instance p4, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 67
    .line 68
    .line 69
    move-result p5

    .line 70
    if-nez p5, :cond_0

    .line 71
    .line 72
    iget-object p5, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 73
    .line 74
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p5, "\u5c81"

    .line 78
    .line 79
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 83
    .line 84
    .line 85
    move-result p5

    .line 86
    if-nez p5, :cond_2

    .line 87
    .line 88
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->length()I

    .line 89
    .line 90
    .line 91
    move-result p5

    .line 92
    if-lez p5, :cond_1

    .line 93
    .line 94
    const-string p5, " \u00b7 "

    .line 95
    .line 96
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    :cond_1
    iget-object p5, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 100
    .line 101
    iget p5, p5, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 102
    .line 103
    invoke-static {p5}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->e(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p5

    .line 107
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    :cond_2
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->g:Lv/VText;

    .line 111
    .line 112
    invoke-virtual {p5, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p4

    .line 119
    if-eqz p4, :cond_3

    .line 120
    .line 121
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->h:Landroid/widget/TextView;

    .line 122
    .line 123
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {p4, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    .line 127
    .line 128
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->j:Lv/VImage;

    .line 129
    .line 130
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->f:Landroid/widget/RelativeLayout;

    .line 134
    .line 135
    const/4 p4, 0x1

    .line 136
    invoke-static {p2, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    iget-wide p2, p3, Lcom/p1/mobile/putong/core/data/Greeting;->createdTime:D

    .line 140
    .line 141
    invoke-static {}, Ll/s75;->l()Ll/s75;

    .line 142
    .line 143
    .line 144
    move-result-object p5

    .line 145
    iget-object p5, p5, Ll/s75;->b:Ll/byd0;

    .line 146
    .line 147
    invoke-virtual {p5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p5

    .line 151
    check-cast p5, Ljava/lang/Long;

    .line 152
    .line 153
    invoke-virtual {p5}, Ljava/lang/Long;->longValue()J

    .line 154
    .line 155
    .line 156
    move-result-wide v2

    .line 157
    long-to-double v2, v2

    .line 158
    cmpl-double p2, p2, v2

    .line 159
    .line 160
    if-lez p2, :cond_4

    .line 161
    .line 162
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->k:Lv/VText;

    .line 163
    .line 164
    invoke-static {p2, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->l:Lv/VText;

    .line 168
    .line 169
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_4
    invoke-static {}, Ll/pzi0;->o()J

    .line 174
    .line 175
    .line 176
    move-result-wide p2

    .line 177
    iget-object p5, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 178
    .line 179
    iget-wide v2, p5, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 180
    .line 181
    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    .line 182
    .line 183
    .line 184
    move-result-wide v2

    .line 185
    sub-long/2addr p2, v2

    .line 186
    const-wide/32 v2, 0x2bf20

    .line 187
    .line 188
    .line 189
    cmp-long p2, p2, v2

    .line 190
    .line 191
    if-gtz p2, :cond_5

    .line 192
    .line 193
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->l:Lv/VText;

    .line 194
    .line 195
    invoke-static {p2, p4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 196
    .line 197
    .line 198
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->k:Lv/VText;

    .line 199
    .line 200
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 201
    .line 202
    .line 203
    goto :goto_0

    .line 204
    :cond_5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->k:Lv/VText;

    .line 205
    .line 206
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 207
    .line 208
    .line 209
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->l:Lv/VText;

    .line 210
    .line 211
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    :goto_0
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 215
    .line 216
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result p2

    .line 220
    if-eqz p2, :cond_6

    .line 221
    .line 222
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 223
    .line 224
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 225
    .line 226
    const-string p2, "superliked"

    .line 227
    .line 228
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    if-eqz p1, :cond_6

    .line 233
    .line 234
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->j:Lv/VImage;

    .line 235
    .line 236
    invoke-static {p1, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 237
    .line 238
    .line 239
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->e:Lv/VImage;

    .line 240
    .line 241
    const/4 p2, 0x4

    .line 242
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 243
    .line 244
    .line 245
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->d:Lv/VImage;

    .line 246
    .line 247
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 248
    .line 249
    .line 250
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->f:Landroid/widget/RelativeLayout;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->f:Landroid/widget/RelativeLayout;

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
