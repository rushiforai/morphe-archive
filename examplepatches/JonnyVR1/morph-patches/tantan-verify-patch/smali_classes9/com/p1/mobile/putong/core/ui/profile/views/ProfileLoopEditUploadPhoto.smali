.class public Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

.field public d:Lv/VLinear;

.field public e:Lv/VFrame;

.field public f:Lv/VDraweeView;

.field public g:Lv/VImage;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->X(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Q(Ll/gcg0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->Z()V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->Y(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T(Ljava/util/List;)Lrx/c;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    new-instance p0, Ll/jpa0;

    .line 34
    .line 35
    invoke-direct {p0}, Ll/jpa0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method private b0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v1, Ll/ipa0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ipa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0xc8

    .line 9
    .line 10
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private getEventId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto$a;->a:[I

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    aget p0, v1, p0

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-eq p0, v1, :cond_4

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    if-eq p0, v1, :cond_3

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    if-eq p0, v1, :cond_2

    .line 24
    .line 25
    const/4 v1, 0x4

    .line 26
    if-eq p0, v1, :cond_1

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    const-string p0, "e_edit_pet_upload"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    const-string p0, "e_edit_house_upload"

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_3
    const-string p0, "e_edit_car_upload"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_4
    const-string p0, "e_edit_height_upload"

    .line 39
    .line 40
    return-object p0
.end method

.method private getImgUriByInputType()Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->getEditAct()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_5

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->getEditAct()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_5

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->getEditAct()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_5

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 33
    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->getEditAct()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto$a;->a:[I

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    aget p0, v2, p0

    .line 59
    .line 60
    const/4 v2, 0x1

    .line 61
    const/4 v3, 0x0

    .line 62
    if-eq p0, v2, :cond_4

    .line 63
    .line 64
    const/4 v2, 0x2

    .line 65
    if-eq p0, v2, :cond_3

    .line 66
    .line 67
    const/4 v2, 0x3

    .line 68
    if-eq p0, v2, :cond_2

    .line 69
    .line 70
    const/4 v2, 0x4

    .line 71
    if-eq p0, v2, :cond_1

    .line 72
    .line 73
    return-object v1

    .line 74
    :cond_1
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 81
    .line 82
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_5

    .line 87
    .line 88
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    check-cast p0, Ljava/lang/String;

    .line 93
    .line 94
    return-object p0

    .line 95
    :cond_2
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserWealth;->houseImg:Ljava/util/List;

    .line 102
    .line 103
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_5

    .line 108
    .line 109
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    check-cast p0, Ljava/lang/String;

    .line 114
    .line 115
    return-object p0

    .line 116
    :cond_3
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserWealth;->carImg:Ljava/util/List;

    .line 123
    .line 124
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_5

    .line 129
    .line 130
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    check-cast p0, Ljava/lang/String;

    .line 135
    .line 136
    return-object p0

    .line 137
    :cond_4
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 142
    .line 143
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->heightImg:Ljava/util/List;

    .line 144
    .line 145
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_5

    .line 150
    .line 151
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    check-cast p0, Ljava/lang/String;

    .line 156
    .line 157
    return-object p0

    .line 158
    :cond_5
    :goto_0
    return-object v1
.end method

.method private getPageId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto$a;->a:[I

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    aget p0, v1, p0

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-eq p0, v1, :cond_4

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    if-eq p0, v1, :cond_3

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    if-eq p0, v1, :cond_2

    .line 24
    .line 25
    const/4 v1, 0x4

    .line 26
    if-eq p0, v1, :cond_1

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    const-string p0, "p_edit_pet"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    const-string p0, "p_edit_house"

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_3
    const-string p0, "p_edit_car"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_4
    const-string p0, "p_edit_height"

    .line 39
    .line 40
    return-object p0
.end method


# virtual methods
.method public final V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kpa0;->a(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/xra;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->j:Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto$a;->a:[I

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    aget p0, v1, p0

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    if-eq p0, v1, :cond_6

    .line 41
    .line 42
    const/4 v1, 0x2

    .line 43
    if-eq p0, v1, :cond_5

    .line 44
    .line 45
    const/4 v1, 0x3

    .line 46
    if-eq p0, v1, :cond_4

    .line 47
    .line 48
    const/4 v1, 0x4

    .line 49
    if-eq p0, v1, :cond_3

    .line 50
    .line 51
    :goto_0
    return-void

    .line 52
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 59
    .line 60
    return-void

    .line 61
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserWealth;->houseImg:Ljava/util/List;

    .line 68
    .line 69
    return-void

    .line 70
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserWealth;->carImg:Ljava/util/List;

    .line 77
    .line 78
    return-void

    .line 79
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Physical;->heightImg:Ljava/util/List;

    .line 86
    .line 87
    return-void
.end method

.method public final synthetic X(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->c0()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->b0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic Y(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p1, "\u4e0a\u4f20\u56fe\u7247\u5931\u8d25\uff01"

    .line 2
    .line 3
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->b0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic Z()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->h:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public a0(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->h:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 41
    .line 42
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->h:Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    const-string v2, "profile"

    .line 49
    .line 50
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    const-string v4, "user-profile"

    .line 55
    .line 56
    invoke-static {v0, v2, v4, v1, v3}, Ll/yb5;->L(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/fpa0;

    .line 61
    .line 62
    invoke-direct {v1}, Ll/fpa0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    new-instance v0, Ll/gpa0;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/gpa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;)V

    .line 84
    .line 85
    .line 86
    new-instance v1, Ll/hpa0;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/hpa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    :cond_0
    return-void
.end method

.method public final c0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v1, v0, 0x1

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->f:Lv/VDraweeView;

    .line 14
    .line 15
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->j:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v2, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->d:Lv/VLinear;

    .line 21
    .line 22
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->e:Lv/VFrame;

    .line 26
    .line 27
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public getEditAct()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->V(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setVisible(Z)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
