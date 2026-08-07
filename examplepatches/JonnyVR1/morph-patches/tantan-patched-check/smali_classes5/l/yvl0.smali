.class public Ll/yvl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/qvl0;",
        ">;"
    }
.end annotation


# static fields
.field public static o:Ljava/lang/String;

.field public static p:Ljava/lang/String;


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VList;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Ll/qvl0;

.field public l:Ll/sul0;

.field public m:Z

.field public n:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/rvl0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/rvl0;-><init>(Ll/yvl0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/yvl0;->n:Ll/y20;

    .line 10
    .line 11
    iput-object p1, p0, Ll/yvl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/yvl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yvl0;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/yvl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yvl0;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/yvl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yvl0;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/yvl0;Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/yvl0;->u(Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic e(Ll/yvl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yvl0;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/yvl0;Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yvl0;->v(Lcom/p1/mobile/putong/data/MessageLocation;)V

    return-void
.end method

.method public static synthetic i()V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yvl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 3

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/yvl0;->m:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/yvl0;->k:Ll/qvl0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/qvl0;->H0()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Ll/yvl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    const/4 v2, 0x5

    .line 19
    if-lt v0, v2, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Xn:I

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-static {v1}, Ll/xxv;->g(Landroid/app/Activity;)Z

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/yvl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    invoke-static {p0, p1, p1}, Lcom/p1/mobile/putong/core/map/IntlMapAct;->h2(Landroid/content/Context;IZ)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 v0, 0x2

    .line 41
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yvl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance p1, Ll/xvl0;

    .line 4
    .line 5
    invoke-direct {p1}, Ll/xvl0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/xxv;->k(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getMomentRoamLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/a;->w(Z)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getMomentRoamLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/yvl0;->k:Ll/qvl0;

    .line 24
    .line 25
    iget-object p0, p0, Ll/yvl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Ll/qvl0;->F0(Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yvl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qvl0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yvl0;->l(Ll/qvl0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yvl0;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zvl0;->b(Ll/yvl0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yvl0;->l:Ll/sul0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 4
    .line 5
    check-cast p1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/sul0;->B(Ljava/util/ArrayList;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public l(Ll/qvl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yvl0;->k:Ll/qvl0;

    .line 2
    .line 3
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/yvl0;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yvl0;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Yn:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/yvl0;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/tvl0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/tvl0;-><init>(Ll/yvl0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/sul0;

    .line 19
    .line 20
    iget-object v1, p0, Ll/yvl0;->k:Ll/qvl0;

    .line 21
    .line 22
    invoke-direct {v0, p0, v1}, Ll/sul0;-><init>(Ll/yvl0;Ll/qvl0;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/yvl0;->l:Ll/sul0;

    .line 26
    .line 27
    iget-object v0, p0, Ll/yvl0;->h:Lv/VList;

    .line 28
    .line 29
    const-string v1, "VipRoamLocationViewModel"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lv/VList;->setCrashLogFlag(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/yvl0;->h:Lv/VList;

    .line 35
    .line 36
    iget-object v1, p0, Ll/yvl0;->l:Ll/sul0;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/yvl0;->c:Lv/VText;

    .line 42
    .line 43
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/yvl0;->g:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Ll/xxv;->u()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    invoke-static {}, Ll/xxv;->t()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    const/4 v0, 0x0

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 69
    :goto_1
    invoke-virtual {p0, v0}, Ll/yvl0;->w(Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/yvl0;->e:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->b:Landroid/widget/ImageView;

    .line 75
    .line 76
    sget v1, Ll/dbc0;->Fr:I

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/yvl0;->i:Lv/VText;

    .line 82
    .line 83
    new-instance v1, Ll/uvl0;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/uvl0;-><init>(Ll/yvl0;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    sget-object v0, Ll/yvl0;->o:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_2

    .line 98
    .line 99
    sget-object v0, Ll/yvl0;->p:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_2

    .line 106
    .line 107
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 118
    .line 119
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 120
    .line 121
    sput-object v1, Ll/yvl0;->o:Ljava/lang/String;

    .line 122
    .line 123
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 124
    .line 125
    sput-object v0, Ll/yvl0;->p:Ljava/lang/String;

    .line 126
    .line 127
    :cond_2
    iget-object v0, p0, Ll/yvl0;->e:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    .line 128
    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->c:Lv/VText;

    .line 130
    .line 131
    sget-object v1, Ll/yvl0;->p:Ljava/lang/String;

    .line 132
    .line 133
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-eqz v1, :cond_3

    .line 138
    .line 139
    iget-object v1, p0, Ll/yvl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 140
    .line 141
    sget v2, Lcom/p1/mobile/putong/core/R$string;->lo:I

    .line 142
    .line 143
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    goto :goto_2

    .line 148
    :cond_3
    sget-object v1, Ll/yvl0;->p:Ljava/lang/String;

    .line 149
    .line 150
    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Ll/yvl0;->d:Lv/VImage;

    .line 154
    .line 155
    new-instance v1, Ll/vvl0;

    .line 156
    .line 157
    invoke-direct {v1, p0}, Ll/vvl0;-><init>(Ll/yvl0;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Ll/yvl0;->e:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    .line 164
    .line 165
    new-instance v1, Ll/wvl0;

    .line 166
    .line 167
    invoke-direct {v1, p0}, Ll/wvl0;-><init>(Ll/yvl0;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    .line 172
    .line 173
    iget-object p0, p0, Ll/yvl0;->d:Lv/VImage;

    .line 174
    .line 175
    sget v0, Ll/dbc0;->Oc:I

    .line 176
    .line 177
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/yvl0;->k:Ll/qvl0;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/qvl0;->H0()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/q;->S:Lcom/p1/mobile/putong/core/api/q$a;

    .line 17
    .line 18
    iget-object p0, p0, Ll/yvl0;->k:Ll/qvl0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/qvl0;->H0()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Ll/mof0;->A(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yvl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/yvl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    filled-new-array {v1}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/svl0;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/svl0;-><init>(Ll/yvl0;Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yvl0;->f:Lv/VText;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object p1, v1

    .line 10
    :cond_0
    sput-object p1, Ll/yvl0;->o:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    move-object p2, v1

    .line 19
    :cond_1
    sput-object p2, Ll/yvl0;->p:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p1, p0, Ll/yvl0;->e:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->c:Lv/VText;

    .line 24
    .line 25
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Ll/yvl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    sget p2, Lcom/p1/mobile/putong/core/R$string;->lo:I

    .line 34
    .line 35
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    goto :goto_0

    .line 40
    :cond_2
    sget-object p0, Ll/yvl0;->p:Ljava/lang/String;

    .line 41
    .line 42
    :goto_0
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public y(Ll/pf60;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/data/RoamedLocationData;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->getMomentRoamLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/yvl0;->e:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->d:Lv/VImage;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/dbc0;->B:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->d:Lv/VImage;

    .line 38
    .line 39
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v2, Ll/dbc0;->A:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p0, p0, Ll/yvl0;->g:Lv/VText;

    .line 53
    .line 54
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-lez p1, :cond_1

    .line 65
    .line 66
    const/4 p1, 0x1

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    const/4 p1, 0x0

    .line 69
    :goto_1
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
