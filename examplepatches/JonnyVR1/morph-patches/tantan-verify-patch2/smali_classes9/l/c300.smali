.class public Ll/c300;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/data/Media;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Lcom/p1/mobile/android/app/Act;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c300;->c:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/c300;->e:Ll/y20;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic F(Ll/c300;Lcom/p1/mobile/putong/data/Media;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/c300;->N(Lcom/p1/mobile/putong/data/Media;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/c300;Lcom/p1/mobile/putong/data/Media;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/c300;->M(Lcom/p1/mobile/putong/data/Media;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic H(Ll/c300;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/c300;->L(ILandroid/view/View;)V

    return-void
.end method

.method private synthetic L(ILandroid/view/View;)V
    .locals 4

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object v0, p0, Ll/c300;->c:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    const-string v1, "from_upload_pic"

    .line 10
    .line 11
    const-string v2, "from_complete_equity_guide"

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-interface {p2, v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ip(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/c300;->c:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    add-int/2addr p1, v3

    .line 24
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string p2, "invisible_photo_location"

    .line 29
    .line 30
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    rsub-int/lit8 p2, p2, 0x3

    .line 49
    .line 50
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    const-string v0, "need_photo_count"

    .line 55
    .line 56
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    const-string v0, "invisible_photo_is_thumbnail"

    .line 61
    .line 62
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    filled-new-array {p1, p2, v0}, [Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const-string p2, "e_invisible_photo_upload"

    .line 73
    .line 74
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/c300;->I(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c300;->d:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/c300;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/qec0;->P4:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public I(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;II)V
    .locals 7

    .line 1
    sget p3, Ll/edc0;->Z2:I

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    move-object v1, p3

    .line 8
    check-cast v1, Lv/VDraweeView;

    .line 9
    .line 10
    sget p3, Ll/edc0;->W1:I

    .line 11
    .line 12
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    check-cast p3, Lv/VImage;

    .line 17
    .line 18
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    sget v0, Ll/ibc0;->X3:I

    .line 33
    .line 34
    invoke-virtual {p3, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, p4}, Ll/c300;->K(I)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    const/4 v6, 0x1

    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 53
    .line 54
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const-string p2, "#4c000000"

    .line 67
    .line 68
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    const/4 v3, 0x2

    .line 73
    const/16 v4, 0x20

    .line 74
    .line 75
    invoke-virtual/range {v0 .. v5}, Ll/fsb0;->P(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;III)V

    .line 76
    .line 77
    .line 78
    new-instance p2, Ll/y200;

    .line 79
    .line 80
    invoke-direct {p2, p0, p4}, Ll/y200;-><init>(Ll/c300;I)V

    .line 81
    .line 82
    .line 83
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p3, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Ll/c300;->c:Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    add-int/2addr p4, v6

    .line 96
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    const-string p2, "invisible_photo_location"

    .line 101
    .line 102
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 107
    .line 108
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 109
    .line 110
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 115
    .line 116
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    rsub-int/lit8 p2, p2, 0x3

    .line 121
    .line 122
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    const-string p3, "need_photo_count"

    .line 127
    .line 128
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    const-string p3, "invisible_photo_is_thumbnail"

    .line 133
    .line 134
    sget-object p4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 135
    .line 136
    invoke-static {p3, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 137
    .line 138
    .line 139
    move-result-object p3

    .line 140
    filled-new-array {p1, p2, p3}, [Ll/pf60;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    const-string p2, "e_invisible_photo_upload"

    .line 145
    .line 146
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_1
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 151
    .line 152
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-virtual {p4, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 168
    .line 169
    .line 170
    move-result-object p4

    .line 171
    iget-object p4, p4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {p4}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p4

    .line 177
    invoke-virtual {v1, p4}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    iget-object p4, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 181
    .line 182
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 183
    .line 184
    .line 185
    move-result p4

    .line 186
    iget-object v1, p0, Ll/c300;->d:Ljava/util/List;

    .line 187
    .line 188
    const/4 v2, 0x0

    .line 189
    const/4 v3, 0x2

    .line 190
    if-le p4, v3, :cond_2

    .line 191
    .line 192
    goto :goto_0

    .line 193
    :cond_2
    iget-object p4, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 194
    .line 195
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 196
    .line 197
    .line 198
    move-result p4

    .line 199
    sub-int/2addr p4, v6

    .line 200
    invoke-interface {v1, v2, p4}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    :goto_0
    new-instance p4, Ll/z200;

    .line 205
    .line 206
    invoke-direct {p4, p0, p2, v1}, Ll/z200;-><init>(Ll/c300;Lcom/p1/mobile/putong/data/Media;Ljava/util/List;)V

    .line 207
    .line 208
    .line 209
    invoke-static {p1, p4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 210
    .line 211
    .line 212
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 213
    .line 214
    .line 215
    return-void
.end method

.method public J(I)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c300;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    return-object p0
.end method

.method public final K(I)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Gi()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->p0()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    return v0

    .line 31
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    const/4 v2, 0x1

    .line 46
    if-ne v1, v2, :cond_1

    .line 47
    .line 48
    if-gez p1, :cond_2

    .line 49
    .line 50
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    const/4 v1, 0x2

    .line 57
    if-ne p0, v1, :cond_3

    .line 58
    .line 59
    if-lt p1, v2, :cond_3

    .line 60
    .line 61
    :cond_2
    return v2

    .line 62
    :cond_3
    return v0
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/data/Media;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    iget-object p2, p0, Ll/c300;->e:Ll/y20;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/c300;->e:Ll/y20;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/data/Media;Ljava/util/List;Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    iget-object v0, p0, Ll/c300;->c:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Gi()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->p0()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-nez v2, :cond_0

    .line 42
    .line 43
    iget-object p2, p0, Ll/c300;->d:Ljava/util/List;

    .line 44
    .line 45
    :cond_0
    new-instance v2, Ll/a300;

    .line 46
    .line 47
    invoke-direct {v2}, Ll/a300;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {p2, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    new-instance v2, Ll/b300;

    .line 55
    .line 56
    invoke-direct {v2, p0, p1}, Ll/b300;-><init>(Ll/c300;Lcom/p1/mobile/putong/data/Media;)V

    .line 57
    .line 58
    .line 59
    invoke-interface {p3, v0, v1, p2, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Zh(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/util/ArrayList;Lcom/p1/mobile/android/app/a$a;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public O(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/c300;->d:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c300;->J(I)Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
