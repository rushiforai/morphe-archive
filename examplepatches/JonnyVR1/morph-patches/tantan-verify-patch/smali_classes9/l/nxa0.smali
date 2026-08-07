.class public Ll/nxa0;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public u:Lv/VLinear_Dividers;

.field public v:Lv/VText;

.field public w:Lv/VDraweeView;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:Ll/fmj;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Ll/nxa0;Lcom/baidu/mapapi/model/LatLng;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nxa0;->X(Lcom/baidu/mapapi/model/LatLng;[I)V

    return-void
.end method

.method public static synthetic S(Ll/nxa0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nxa0;->W(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T(Ll/nxa0;Ll/z80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nxa0;->V(Ll/z80;)V

    return-void
.end method


# virtual methods
.method public O()Ll/t3m;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/on2;->w()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/t3m;

    .line 6
    .line 7
    return-object p0
.end method

.method public U(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/oxa0;->b(Ll/nxa0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic V(Ll/z80;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, ""

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move-object v0, v1

    .line 19
    :goto_0
    invoke-virtual {p1}, Ll/z80;->c()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/z80;->c()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move-object v2, v1

    .line 35
    :goto_1
    invoke-virtual {p1}, Ll/z80;->f()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-nez v3, :cond_2

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/z80;->f()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v1, p0, Ll/nxa0;->x:Lv/VText;

    .line 72
    .line 73
    if-nez v0, :cond_3

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/nxa0;->O()Ll/t3m;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    sget v2, Lcom/p1/mobile/putong/core/R$string;->qk:I

    .line 86
    .line 87
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {v0, v2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Ll/nxa0;->x:Lv/VText;

    .line 99
    .line 100
    const/4 p1, 0x1

    .line 101
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    const/4 p0, 0x0

    .line 106
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final synthetic W(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nxa0;->x:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic X(Lcom/baidu/mapapi/model/LatLng;[I)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v0, p2, v0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    aget p2, p2, v1

    .line 6
    .line 7
    const/16 v1, 0x320

    .line 8
    .line 9
    if-le v0, v1, :cond_0

    .line 10
    .line 11
    mul-int/lit16 p2, p2, 0x320

    .line 12
    .line 13
    div-int/2addr p2, v0

    .line 14
    move v0, v1

    .line 15
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "http://api.map.baidu.com/staticimage/v2?ak=islEGFAbydBfWxshdNB3jYeG&center="

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-wide v2, p1, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 23
    .line 24
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, ","

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-wide v2, p1, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 33
    .line 34
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p1, "&width="

    .line 38
    .line 39
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p1, "&height="

    .line 46
    .line 47
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p1, "&zoom=18&mcode=93:E8:C2:C3:D3:8A:72:EC:04:85:85:70:B3:3F:E5:FB:69:31:CC:1B;com.p1.mobile.putong"

    .line 54
    .line 55
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 63
    .line 64
    iget-object p0, p0, Ll/nxa0;->w:Lv/VDraweeView;

    .line 65
    .line 66
    invoke-virtual {p2, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final Y(Lcom/p1/mobile/putong/data/User;)V
    .locals 11

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance v0, Lcom/baidu/mapapi/model/LatLng;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Passby;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 17
    .line 18
    iget-wide v2, v1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 19
    .line 20
    iget-wide v4, v1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 21
    .line 22
    invoke-direct {v0, v2, v3, v4, v5}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/xc2;->b(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Ll/nxa0;->z:Ll/fmj;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/on2;->p()Ll/ner;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1, v2}, Ll/fmj;->c(Ll/ner;Z)Ll/fmj;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, p0, Ll/nxa0;->z:Ll/fmj;

    .line 43
    .line 44
    :cond_1
    iget-object v3, p0, Ll/nxa0;->z:Ll/fmj;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/on2;->p()Ll/ner;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    iget-wide v5, v0, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 51
    .line 52
    iget-wide v7, v0, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 53
    .line 54
    new-instance v9, Ll/kxa0;

    .line 55
    .line 56
    invoke-direct {v9, p0}, Ll/kxa0;-><init>(Ll/nxa0;)V

    .line 57
    .line 58
    .line 59
    new-instance v10, Ll/lxa0;

    .line 60
    .line 61
    invoke-direct {v10, p0}, Ll/lxa0;-><init>(Ll/nxa0;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual/range {v3 .. v10}, Ll/fmj;->e(Ll/ner;DDLl/y20;Ll/y20;)V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Ll/nxa0;->v:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/nxa0;->O()Ll/t3m;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-interface {v3}, Ll/nol;->act()Landroid/app/Activity;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    check-cast v3, Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    iget v4, p1, Lcom/p1/mobile/putong/data/Passby;->count:I

    .line 80
    .line 81
    const/4 v5, 0x1

    .line 82
    if-le v4, v5, :cond_2

    .line 83
    .line 84
    sget v5, Lcom/p1/mobile/putong/core/R$string;->pk:I

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    sget v5, Lcom/p1/mobile/putong/core/R$string;->ok:I

    .line 88
    .line 89
    :goto_0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-virtual {v3, v5, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    const/4 v4, 0x3

    .line 102
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-static {v3, v2, v4}, Ll/q8g0;->N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ll/nxa0;->w:Lv/VDraweeView;

    .line 114
    .line 115
    new-instance v2, Ll/mxa0;

    .line 116
    .line 117
    invoke-direct {v2, p0, v0}, Ll/mxa0;-><init>(Ll/nxa0;Lcom/baidu/mapapi/model/LatLng;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v1, v2}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Ll/nxa0;->y:Lv/VText;

    .line 124
    .line 125
    invoke-static {}, Ll/pzi0;->q()Ljava/text/SimpleDateFormat;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    new-instance v1, Ljava/util/Date;

    .line 130
    .line 131
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/Passby;->latestTime:D

    .line 132
    .line 133
    double-to-long v2, v2

    .line 134
    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/nxa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/nxa0;->U(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nxa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/nxa0;->Y(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
