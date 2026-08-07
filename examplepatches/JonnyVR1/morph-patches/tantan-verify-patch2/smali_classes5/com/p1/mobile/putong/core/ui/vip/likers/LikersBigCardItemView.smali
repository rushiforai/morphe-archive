.class public Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Lv/VImage;

.field public g:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public h:Landroid/widget/FrameLayout;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/ImageView;

.field public k:Lv/VText;

.field public l:Lv/VLinear_FillerMeasure;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lcom/p1/mobile/putong/data/User;

.field public r:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->HIDE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->r:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 7
    .line 8
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

    .line 9
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->HIDE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->r:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

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

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->HIDE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->r:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    return-void
.end method

.method public static synthetic b(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;Ll/x20;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->r(Ll/x20;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "personality"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private m()Lcom/p1/mobile/android/app/Act;
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

.method public static n(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->o(Lcom/p1/mobile/putong/data/Profile;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/data/Tag;

    .line 42
    .line 43
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->o(Lcom/p1/mobile/putong/data/Profile;)Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_0

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Lcom/p1/mobile/putong/data/Tag;

    .line 64
    .line 65
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_1

    .line 74
    .line 75
    iget-object p0, v2, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 76
    .line 77
    return-object p0

    .line 78
    :cond_2
    const/4 p0, 0x0

    .line 79
    return-object p0
.end method

.method public static o(Lcom/p1/mobile/putong/data/Profile;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Profile;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/akr;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/akr;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static s(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/lit8 v0, v0, -0x3

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-gt v0, v1, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    add-int/lit8 p0, p0, 0x7

    .line 36
    .line 37
    if-gt v0, p0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    add-int/lit8 v0, v0, -0x7

    .line 45
    .line 46
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-gt v0, v1, :cond_1

    .line 53
    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    add-int/lit8 p0, p0, 0x3

    .line 67
    .line 68
    if-gt v0, p0, :cond_1

    .line 69
    .line 70
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ll/ina;->z3(Lcom/p1/mobile/putong/data/User;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_1

    .line 79
    .line 80
    const/4 p0, 0x1

    .line 81
    return p0

    .line 82
    :cond_1
    const/4 p0, 0x0

    .line 83
    return p0
.end method

.method private u(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-double v0, v0

    .line 6
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 7
    .line 8
    iget-wide v2, v2, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 9
    .line 10
    sub-double/2addr v0, v2

    .line 11
    const-wide v2, 0x413b774000000000L    # 1800000.0

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    cmpl-double v0, v0, v2

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x1

    .line 20
    if-lez v0, :cond_0

    .line 21
    .line 22
    move v0, v2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v0, v1

    .line 25
    :goto_0
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 28
    .line 29
    invoke-virtual {v3, p2}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-nez v3, :cond_5

    .line 34
    .line 35
    iget-object v3, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 36
    .line 37
    iget v3, v3, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 38
    .line 39
    const/16 v4, 0x1388

    .line 40
    .line 41
    if-le v3, v4, :cond_1

    .line 42
    .line 43
    if-eqz v0, :cond_5

    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->p:Lv/VText;

    .line 46
    .line 47
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 51
    .line 52
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 53
    .line 54
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 55
    .line 56
    const/16 v3, 0x2710

    .line 57
    .line 58
    if-lt v0, v3, :cond_2

    .line 59
    .line 60
    iget-object v0, v1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    iget-object p1, v1, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_2

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->p:Lv/VText;

    .line 83
    .line 84
    iget-object p1, v1, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 91
    .line 92
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 93
    .line 94
    if-lt p1, v3, :cond_3

    .line 95
    .line 96
    iget-object p1, v1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_3

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->p:Lv/VText;

    .line 105
    .line 106
    iget-object p1, v1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 113
    .line 114
    iget p2, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 115
    .line 116
    if-lt p2, v3, :cond_4

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->p:Lv/VText;

    .line 119
    .line 120
    const-string p1, "10km+"

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_4
    invoke-static {p1, v2}, Ll/q8g0;->q(Lcom/p1/mobile/putong/data/Location;Z)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->p:Lv/VText;

    .line 131
    .line 132
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->p:Lv/VText;

    .line 137
    .line 138
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method private x(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-double v0, v0

    .line 6
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 7
    .line 8
    iget-wide v3, v2, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 9
    .line 10
    sub-double/2addr v0, v3

    .line 11
    const-wide v3, 0x413b774000000000L    # 1800000.0

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    cmpg-double v0, v0, v3

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    const/4 v3, 0x0

    .line 20
    if-gtz v0, :cond_0

    .line 21
    .line 22
    move v0, v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v0, v3

    .line 25
    :goto_0
    iget v2, v2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 26
    .line 27
    const/16 v4, 0x1388

    .line 28
    .line 29
    if-le v2, v4, :cond_1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move v1, v3

    .line 33
    :goto_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 36
    .line 37
    invoke-virtual {v2, p1}, Ll/ina;->w3(Lcom/p1/mobile/putong/data/User;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-nez v2, :cond_3

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->o:Lv/VText;

    .line 48
    .line 49
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->m()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->q1:I

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 63
    .line 64
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 65
    .line 66
    invoke-static {v1, v2}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->o:Lv/VText;

    .line 75
    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    const-string p1, "\u5728\u7ebf"

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    const-string v0, "%s\u6d3b\u8dc3"

    .line 85
    .line 86
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->o:Lv/VText;

    .line 99
    .line 100
    const/16 p1, 0x8

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 103
    .line 104
    .line 105
    return-void
.end method


# virtual methods
.method public final l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ekr;->a(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->l(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
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
    invoke-super {p0, p1, p2}, Landroidx/cardview/widget/CardView;->onMeasure(II)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    invoke-static {}, Ll/bnl0;->y0()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    div-int/lit8 p2, p2, 0x2

    .line 37
    .line 38
    sget v0, Ll/qa00;->j:I

    .line 39
    .line 40
    sub-int/2addr p2, v0

    .line 41
    int-to-double v0, p2

    .line 42
    mul-double/2addr v0, v2

    .line 43
    const-wide v2, 0x3fd851eb80000000L    # 0.3799999952316284

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    mul-double/2addr v0, v2

    .line 49
    double-to-int p2, v0

    .line 50
    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 51
    .line 52
    if-eq v0, p2, :cond_0

    .line 53
    .line 54
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/data/User;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 2
    .param p2    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->i:Landroid/widget/ImageView;

    .line 2
    .line 3
    new-instance v1, Ll/xjr;

    .line 4
    .line 5
    invoke-direct {v1, p3}, Ll/xjr;-><init>(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->j:Landroid/widget/ImageView;

    .line 12
    .line 13
    new-instance v0, Ll/yjr;

    .line 14
    .line 15
    invoke-direct {v0, p4}, Ll/yjr;-><init>(Ll/x20;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    new-instance p3, Ll/zjr;

    .line 22
    .line 23
    invoke-direct {p3, p0, p2, p1}, Ll/zjr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;Ll/x20;Lcom/p1/mobile/putong/data/User;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public q(Ll/x20;Ll/x20;Ll/x20;)V
    .locals 2
    .param p1    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->i:Landroid/widget/ImageView;

    .line 2
    .line 3
    new-instance v1, Ll/bkr;

    .line 4
    .line 5
    invoke-direct {v1, p2}, Ll/bkr;-><init>(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->j:Landroid/widget/ImageView;

    .line 12
    .line 13
    new-instance v0, Ll/ckr;

    .line 14
    .line 15
    invoke-direct {v0, p3}, Ll/ckr;-><init>(Ll/x20;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    new-instance p2, Ll/dkr;

    .line 22
    .line 23
    invoke-direct {p2, p1}, Ll/dkr;-><init>(Ll/x20;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic r(Ll/x20;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->a:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->c:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->m()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p1, p2, p3, v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ss(Lcom/p1/mobile/putong/data/User;Lv/VDraweeView;Landroid/widget/LinearLayout;Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setNewLikesBadgesText(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->r:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->NEW_LIKE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/data/User;J)V
    .locals 7

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->q:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->f:Lv/VImage;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->e:Lv/VImage;

    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->j:Landroid/widget/ImageView;

    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->i:Landroid/widget/ImageView;

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->m:Lv/VText;

    .line 34
    .line 35
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->s(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->n:Lv/VText;

    .line 45
    .line 46
    const-string v5, ""

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 66
    .line 67
    invoke-static {v1, v2}, Ll/q8g0;->k0(Lcom/p1/mobile/putong/data/ProfileZodiac;Z)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-nez v4, :cond_2

    .line 76
    .line 77
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->n(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-nez v5, :cond_1

    .line 86
    .line 87
    new-instance v5, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v1, " \u00b7 \u559c\u6b22%s"

    .line 96
    .line 97
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    :cond_1
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->k:Lv/VText;

    .line 113
    .line 114
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->k:Lv/VText;

    .line 119
    .line 120
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    :goto_1
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->u(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 124
    .line 125
    .line 126
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->x(Lcom/p1/mobile/putong/data/User;)V

    .line 127
    .line 128
    .line 129
    invoke-static {p1}, Ll/wj90;->c(Lcom/p1/mobile/putong/data/User;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_3

    .line 134
    .line 135
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->a:Lv/VDraweeView;

    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 144
    .line 145
    .line 146
    move-result-object v4

    .line 147
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    const/4 v5, 0x3

    .line 152
    const/16 v6, 0x64

    .line 153
    .line 154
    invoke-virtual {v0, v1, v4, v5, v6}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 155
    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 159
    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->a:Lv/VDraweeView;

    .line 161
    .line 162
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-virtual {v0, v1, v4, v2}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 175
    .line 176
    .line 177
    :goto_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->v(Lcom/p1/mobile/putong/data/User;J)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->w(Lcom/p1/mobile/putong/data/User;)V

    .line 181
    .line 182
    .line 183
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 188
    .line 189
    .line 190
    move-result-object p2

    .line 191
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->B7()Z

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    if-eqz p2, :cond_5

    .line 196
    .line 197
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 198
    .line 199
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 200
    .line 201
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->C5(Lcom/p1/mobile/putong/data/User;)Z

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    if-nez p1, :cond_5

    .line 206
    .line 207
    invoke-static {}, Ll/joa;->f4()Z

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    if-eqz p1, :cond_4

    .line 212
    .line 213
    invoke-static {}, Ll/joa;->G3()Z

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    if-eqz p1, :cond_5

    .line 218
    .line 219
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->j:Landroid/widget/ImageView;

    .line 220
    .line 221
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 222
    .line 223
    .line 224
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->i:Landroid/widget/ImageView;

    .line 225
    .line 226
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 227
    .line 228
    .line 229
    const-string p0, "e_see_card_greet"

    .line 230
    .line 231
    const-string p1, "p_see_who_likes_me_view"

    .line 232
    .line 233
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    :cond_5
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/data/User;J)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 8
    .line 9
    const/4 v2, 0x3

    .line 10
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v0, v3, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->HIDE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->r:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v3, 0x1

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeCardInfo;->cardTypes:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeCardInfo;->cardTypes:Ljava/util/List;

    .line 62
    .line 63
    const-string v4, "newLikeAfterVerification"

    .line 64
    .line 65
    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    sget-object p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->VERIFY:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 72
    .line 73
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->r:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 76
    .line 77
    const-string p2, "\u6765\u81ea\u9080\u8bf7\u8ba4\u8bc1"

    .line 78
    .line 79
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 83
    .line 84
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 90
    .line 91
    sget-object p2, Ll/uqb0;->b0:Ll/sre0;

    .line 92
    .line 93
    iget-object p2, p2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 94
    .line 95
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    if-eqz p2, :cond_0

    .line 100
    .line 101
    sget p2, Ll/gbc0;->l2:I

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_0
    sget p2, Ll/gbc0;->k2:I

    .line 105
    .line 106
    :goto_0
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 110
    .line 111
    sget-object p2, Ll/uqb0;->b0:Ll/sre0;

    .line 112
    .line 113
    iget-object p2, p2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 114
    .line 115
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    if-eqz p2, :cond_1

    .line 120
    .line 121
    sget p2, Ll/gbc0;->h2:I

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_1
    sget p2, Ll/gbc0;->g2:I

    .line 125
    .line 126
    :goto_1
    invoke-virtual {p1, p2, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 130
    .line 131
    invoke-static {p0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_5

    .line 140
    .line 141
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->sf()Z

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    if-eqz p2, :cond_3

    .line 154
    .line 155
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 156
    .line 157
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    if-eqz p2, :cond_3

    .line 162
    .line 163
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 164
    .line 165
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 166
    .line 167
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    if-eqz p2, :cond_3

    .line 172
    .line 173
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 178
    .line 179
    .line 180
    move-result-object p2

    .line 181
    iget-object p3, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 182
    .line 183
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 184
    .line 185
    iget-object p3, p3, Lcom/p1/mobile/putong/data/RelationshipExtensions;->recvSuperLikedNum:Ljava/lang/String;

    .line 186
    .line 187
    invoke-interface {p2, p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Hl(Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    move-result p2

    .line 191
    if-le p2, v3, :cond_3

    .line 192
    .line 193
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 194
    .line 195
    const/4 p3, 0x2

    .line 196
    invoke-static {p3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 197
    .line 198
    .line 199
    move-result-object p3

    .line 200
    invoke-virtual {p2, p3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 201
    .line 202
    .line 203
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 204
    .line 205
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 206
    .line 207
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 208
    .line 209
    iget-object p1, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->recvSuperLikedNum:Ljava/lang/String;

    .line 210
    .line 211
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    const-string p3, "\u8d85\u7ea7\u559c\u6b22x%s"

    .line 216
    .line 217
    invoke-static {p3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 222
    .line 223
    .line 224
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 225
    .line 226
    sget p2, Ll/qa00;->a:I

    .line 227
    .line 228
    neg-int p2, p2

    .line 229
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 230
    .line 231
    .line 232
    goto :goto_3

    .line 233
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 234
    .line 235
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 236
    .line 237
    .line 238
    move-result-object p3

    .line 239
    invoke-virtual {p2, p3, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 240
    .line 241
    .line 242
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 243
    .line 244
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    if-eqz p1, :cond_4

    .line 249
    .line 250
    const-string p1, "\u5979"

    .line 251
    .line 252
    goto :goto_2

    .line 253
    :cond_4
    const-string p1, "\u4ed6"

    .line 254
    .line 255
    :goto_2
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    const-string p3, "%s\u8d85\u7ea7\u559c\u6b22\u4f60"

    .line 260
    .line 261
    invoke-static {p3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    .line 267
    .line 268
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 269
    .line 270
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 271
    .line 272
    .line 273
    :goto_3
    sget-object p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->SUPER_LIKE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 274
    .line 275
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->r:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 276
    .line 277
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 278
    .line 279
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 280
    .line 281
    .line 282
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 283
    .line 284
    sget p2, Ll/gbc0;->m2:I

    .line 285
    .line 286
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 287
    .line 288
    .line 289
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 290
    .line 291
    sget p1, Ll/gbc0;->e2:I

    .line 292
    .line 293
    invoke-virtual {p0, p1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :cond_5
    const-wide/16 v4, 0x0

    .line 298
    .line 299
    cmp-long v0, p2, v4

    .line 300
    .line 301
    if-lez v0, :cond_6

    .line 302
    .line 303
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 304
    .line 305
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-eqz v0, :cond_6

    .line 310
    .line 311
    long-to-double p2, p2

    .line 312
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 313
    .line 314
    iget-wide v4, p1, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 315
    .line 316
    cmpg-double p1, p2, v4

    .line 317
    .line 318
    if-gez p1, :cond_6

    .line 319
    .line 320
    sget-object p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->NEW_LIKE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 321
    .line 322
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->r:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 323
    .line 324
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 325
    .line 326
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 327
    .line 328
    .line 329
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 330
    .line 331
    const-string p2, "\u65b0\u559c\u6b22"

    .line 332
    .line 333
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 334
    .line 335
    .line 336
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 337
    .line 338
    sget p2, Ll/gbc0;->k2:I

    .line 339
    .line 340
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 341
    .line 342
    .line 343
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->b:Lv/VText;

    .line 344
    .line 345
    sget p1, Ll/gbc0;->d2:I

    .line 346
    .line 347
    invoke-virtual {p0, p1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 348
    .line 349
    .line 350
    :cond_6
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->d:Lv/VImage;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Ll/gbc0;->w5:I

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget v0, Ll/gbc0;->I1:I

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->c:Landroid/widget/LinearLayout;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->d:Lv/VImage;

    .line 23
    .line 24
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/data/User;->showPicVerificationIcon(Landroid/view/View;Lv/VImage;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
