.class public Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView$LikersItemStyle;
    }
.end annotation


# static fields
.field public static y:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VImage;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Lv/VImage;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Landroid/widget/ImageView;

.field public m:Landroid/widget/FrameLayout;

.field public n:Landroid/widget/FrameLayout;

.field public o:Lv/VText;

.field public p:Lv/VLinear_FillerMeasure;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Landroid/widget/ImageView;

.field public t:Lv/VLinear_FillerMeasure;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Lcom/p1/mobile/putong/data/User;

.field public x:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->y:Lrx/subjects/b;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->y:Lrx/subjects/b;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v0, Ll/qkr;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/qkr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-wide/16 v0, 0x5dc

    .line 24
    .line 25
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1, v2}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v0, Ll/rkr;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/rkr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lrx/c;->subscribe()Ll/kcg0;

    .line 41
    .line 42
    .line 43
    const/4 p1, 0x1

    .line 44
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->x:Z

    .line 45
    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 47
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    move-result-object p1

    sget-object p2, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->y:Lrx/subjects/b;

    .line 49
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object p1

    new-instance p2, Ll/qkr;

    invoke-direct {p2, p0}, Ll/qkr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;)V

    .line 50
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    move-result-object p1

    const-wide/16 v0, 0x5dc

    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 51
    invoke-virtual {p1, v0, v1, p2}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    move-result-object p1

    new-instance p2, Ll/rkr;

    invoke-direct {p2, p0}, Ll/rkr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;)V

    .line 52
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lrx/c;->subscribe()Ll/kcg0;

    const/4 p1, 0x1

    .line 54
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->x:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 55
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    move-result-object p1

    sget-object p2, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->y:Lrx/subjects/b;

    .line 57
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object p1

    new-instance p2, Ll/qkr;

    invoke-direct {p2, p0}, Ll/qkr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;)V

    .line 58
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    move-result-object p1

    const-wide/16 p2, 0x5dc

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 59
    invoke-virtual {p1, p2, p3, v0}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    move-result-object p1

    new-instance p2, Ll/rkr;

    invoke-direct {p2, p0}, Ll/rkr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;)V

    .line 60
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    move-result-object p1

    .line 61
    invoke-virtual {p1}, Lrx/c;->subscribe()Ll/kcg0;

    const/4 p1, 0x1

    .line 62
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->x:Z

    return-void
.end method

.method public static synthetic a(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->h(Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;Ll/x20;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->j(Ll/x20;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->i(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static k(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/CharSequence;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->clone()Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->isHideInfo()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->isHideRegionCity()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 19
    .line 20
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->isHideRegionDistrict()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 30
    .line 31
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 32
    .line 33
    :cond_1
    :goto_0
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 34
    .line 35
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 36
    .line 37
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 38
    .line 39
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_5

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Region;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-nez v1, :cond_3

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v3, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_3

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-nez v1, :cond_3

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 91
    .line 92
    iget-object v3, v0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_3

    .line 99
    .line 100
    const-string p0, ""

    .line 101
    .line 102
    return-object p0

    .line 103
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-nez v1, :cond_4

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-nez v1, :cond_4

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v3, v0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_4

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 130
    .line 131
    return-object p0

    .line 132
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    if-nez v1, :cond_5

    .line 139
    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 141
    .line 142
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-nez v0, :cond_5

    .line 149
    .line 150
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 151
    .line 152
    if-eqz p0, :cond_5

    .line 153
    .line 154
    return-object p0

    .line 155
    :cond_5
    :goto_1
    return-object v2
.end method

.method public static l(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 6
    .line 7
    if-nez p0, :cond_3

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->l()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 26
    .line 27
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Dn(Lcom/p1/mobile/putong/data/QualificationType;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p0}, Ll/r8g0;->b(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_0

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 49
    .line 50
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/Work;->active:Z

    .line 51
    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_1

    .line 61
    .line 62
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    const-string p0, ""

    .line 70
    .line 71
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_2
    const/4 p0, 0x0

    .line 85
    goto :goto_2

    .line 86
    :cond_3
    :goto_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 91
    .line 92
    :cond_4
    :goto_2
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_6

    .line 97
    .line 98
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 101
    .line 102
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 103
    .line 104
    if-eqz p1, :cond_5

    .line 105
    .line 106
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 107
    .line 108
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->S0:I

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0

    .line 115
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 118
    .line 119
    :cond_6
    return-object p0
.end method

.method public static n(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->clone()Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1, v1}, Ll/q8g0;->r(Lcom/p1/mobile/putong/data/Location;ZZ)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->k(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/CharSequence;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 22
    .line 23
    sget v1, Lcom/p1/mobile/putong/common/R$string;->K1:I

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vkr;->a(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g()Lcom/p1/mobile/android/app/Act;
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

.method public final synthetic h(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->x:Z

    .line 3
    .line 4
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic i(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->x:Z

    .line 3
    .line 4
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic j(Ll/x20;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p5

    .line 5
    invoke-virtual {p5}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object p5

    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p5, v0, :cond_2

    .line 12
    .line 13
    iget-boolean p5, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->x:Z

    .line 14
    .line 15
    if-nez p5, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    if-nez p2, :cond_1

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->a:Lv/VDraweeView;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->c:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    invoke-interface {p1, p2, p3, p4, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Yj(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lv/VDraweeView;Landroid/widget/LinearLayout;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    const-string p0, "seepagePhotoClick"

    .line 44
    .line 45
    invoke-virtual {p4, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->W4(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;Lcom/p1/mobile/putong/data/User;JLl/x20;ZLcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView$LikersItemStyle;Ll/x20;Ll/x20;)V
    .locals 6

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->w:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    new-instance v0, Ll/skr;

    .line 4
    .line 5
    move-object v1, p0

    .line 6
    move-object v5, p1

    .line 7
    move-object v4, p2

    .line 8
    move-object v2, p5

    .line 9
    move v3, p6

    .line 10
    invoke-direct/range {v0 .. v5}, Ll/skr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;Ll/x20;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView$LikersItemStyle;->newStyle1:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView$LikersItemStyle;

    .line 17
    .line 18
    const/4 p1, 0x2

    .line 19
    const/4 p2, 0x4

    .line 20
    const/16 p5, 0x8

    .line 21
    .line 22
    const/4 p6, 0x0

    .line 23
    if-ne p7, p0, :cond_0

    .line 24
    .line 25
    new-instance p0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 28
    .line 29
    .line 30
    sget p3, Ll/qa00;->e:I

    .line 31
    .line 32
    int-to-float p3, p3

    .line 33
    invoke-virtual {p0, p3}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 34
    .line 35
    .line 36
    iget-object p3, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->a:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-virtual {p3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    check-cast p3, Ll/wlj;

    .line 43
    .line 44
    invoke-virtual {p3, p0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->a:Lv/VDraweeView;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const/high16 p3, 0x43580000    # 216.0f

    .line 54
    .line 55
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    iput p3, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 60
    .line 61
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 62
    .line 63
    iget-object p3, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->a:Lv/VDraweeView;

    .line 64
    .line 65
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 66
    .line 67
    .line 68
    move-result-object p4

    .line 69
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 70
    .line 71
    .line 72
    move-result-object p4

    .line 73
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p4

    .line 77
    const/16 p7, 0x1e

    .line 78
    .line 79
    invoke-virtual {p0, p3, p4, p1, p7}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 80
    .line 81
    .line 82
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->m:Landroid/widget/FrameLayout;

    .line 83
    .line 84
    invoke-virtual {p0, p6}, Landroid/view/View;->setVisibility(I)V

    .line 85
    .line 86
    .line 87
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->i:Landroid/widget/FrameLayout;

    .line 88
    .line 89
    invoke-virtual {p0, p5}, Landroid/view/View;->setVisibility(I)V

    .line 90
    .line 91
    .line 92
    goto/16 :goto_3

    .line 93
    .line 94
    :cond_0
    invoke-static {}, Ll/h9n;->c()Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    if-eqz p0, :cond_1

    .line 99
    .line 100
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->o(Lcom/p1/mobile/putong/data/User;)V

    .line 101
    .line 102
    .line 103
    goto/16 :goto_1

    .line 104
    .line 105
    :cond_1
    new-instance p0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 106
    .line 107
    invoke-direct {p0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 108
    .line 109
    .line 110
    sget p7, Ll/qa00;->e:I

    .line 111
    .line 112
    int-to-float v0, p7

    .line 113
    int-to-float p7, p7

    .line 114
    const/4 v2, 0x0

    .line 115
    invoke-virtual {p0, v0, p7, v2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 116
    .line 117
    .line 118
    iget-object p7, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->a:Lv/VDraweeView;

    .line 119
    .line 120
    invoke-virtual {p7}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 121
    .line 122
    .line 123
    move-result-object p7

    .line 124
    check-cast p7, Ll/wlj;

    .line 125
    .line 126
    invoke-virtual {p7, p0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 127
    .line 128
    .line 129
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->a:Lv/VDraweeView;

    .line 130
    .line 131
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    const/high16 p7, 0x43360000    # 182.0f

    .line 136
    .line 137
    invoke-static {p7}, Ll/qa00;->d(F)I

    .line 138
    .line 139
    .line 140
    move-result p7

    .line 141
    iput p7, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 142
    .line 143
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->i:Landroid/widget/FrameLayout;

    .line 144
    .line 145
    invoke-virtual {p0, p6}, Landroid/view/View;->setVisibility(I)V

    .line 146
    .line 147
    .line 148
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->m:Landroid/widget/FrameLayout;

    .line 149
    .line 150
    invoke-virtual {p0, p5}, Landroid/view/View;->setVisibility(I)V

    .line 151
    .line 152
    .line 153
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->n:Landroid/widget/FrameLayout;

    .line 154
    .line 155
    invoke-virtual {p0, p5}, Landroid/view/View;->setVisibility(I)V

    .line 156
    .line 157
    .line 158
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->j:Lv/VText;

    .line 159
    .line 160
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 161
    .line 162
    .line 163
    move-result-object p7

    .line 164
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->a1:I

    .line 165
    .line 166
    iget-object v2, v4, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 167
    .line 168
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {p7, v0, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p7

    .line 176
    invoke-virtual {p0, p7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    .line 178
    .line 179
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 180
    .line 181
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 182
    .line 183
    invoke-virtual {p0, v4}, Ll/ina;->z3(Lcom/p1/mobile/putong/data/User;)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    iget-object p7, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->k:Lv/VText;

    .line 188
    .line 189
    if-eqz p0, :cond_2

    .line 190
    .line 191
    const-string p0, ""

    .line 192
    .line 193
    invoke-virtual {p7, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    .line 195
    .line 196
    goto :goto_0

    .line 197
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->Z0:I

    .line 202
    .line 203
    iget-object v2, v4, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 204
    .line 205
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {p7, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 218
    .line 219
    .line 220
    :goto_0
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 221
    .line 222
    .line 223
    move-result p0

    .line 224
    if-eqz p0, :cond_3

    .line 225
    .line 226
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->l:Landroid/widget/ImageView;

    .line 227
    .line 228
    invoke-virtual {p0, p6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 229
    .line 230
    .line 231
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->l:Landroid/widget/ImageView;

    .line 232
    .line 233
    sget p5, Ll/gbc0;->n2:I

    .line 234
    .line 235
    invoke-virtual {p0, p5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 236
    .line 237
    .line 238
    goto :goto_1

    .line 239
    :cond_3
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->boosted()Z

    .line 240
    .line 241
    .line 242
    move-result p0

    .line 243
    iget-object p7, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->l:Landroid/widget/ImageView;

    .line 244
    .line 245
    if-eqz p0, :cond_4

    .line 246
    .line 247
    invoke-virtual {p7, p6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 248
    .line 249
    .line 250
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->l:Landroid/widget/ImageView;

    .line 251
    .line 252
    sget p5, Ll/gbc0;->d6:I

    .line 253
    .line 254
    invoke-virtual {p0, p5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 255
    .line 256
    .line 257
    goto :goto_1

    .line 258
    :cond_4
    invoke-virtual {p7, p5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 259
    .line 260
    .line 261
    :goto_1
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->c:Landroid/widget/LinearLayout;

    .line 262
    .line 263
    iget-object p5, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->d:Lv/VImage;

    .line 264
    .line 265
    invoke-virtual {v4, p0, p5}, Lcom/p1/mobile/putong/data/User;->showPicVerificationIcon(Landroid/view/View;Lv/VImage;)V

    .line 266
    .line 267
    .line 268
    if-nez v3, :cond_7

    .line 269
    .line 270
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 271
    .line 272
    iget-object p1, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->a:Lv/VDraweeView;

    .line 273
    .line 274
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 275
    .line 276
    .line 277
    move-result-object p5

    .line 278
    invoke-virtual {p5}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 279
    .line 280
    .line 281
    move-result-object p5

    .line 282
    invoke-virtual {p5}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p5

    .line 286
    invoke-virtual {p0, p1, p5, p6}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 287
    .line 288
    .line 289
    const-wide/16 p0, 0x0

    .line 290
    .line 291
    cmp-long p0, p3, p0

    .line 292
    .line 293
    if-eqz p0, :cond_6

    .line 294
    .line 295
    iget-object p0, v4, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 296
    .line 297
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result p0

    .line 301
    if-eqz p0, :cond_6

    .line 302
    .line 303
    iget-object p0, v4, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 304
    .line 305
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 306
    .line 307
    const-wide/16 v2, 0x0

    .line 308
    .line 309
    cmpl-double p5, p0, v2

    .line 310
    .line 311
    if-eqz p5, :cond_6

    .line 312
    .line 313
    double-to-long p0, p0

    .line 314
    iget-object p5, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->b:Lv/VImage;

    .line 315
    .line 316
    cmp-long p0, p3, p0

    .line 317
    .line 318
    if-gez p0, :cond_5

    .line 319
    .line 320
    const/4 p0, 0x1

    .line 321
    goto :goto_2

    .line 322
    :cond_5
    move p0, p6

    .line 323
    :goto_2
    invoke-static {p5, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 324
    .line 325
    .line 326
    goto :goto_3

    .line 327
    :cond_6
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->b:Lv/VImage;

    .line 328
    .line 329
    invoke-static {p0, p6}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 330
    .line 331
    .line 332
    goto :goto_3

    .line 333
    :cond_7
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 334
    .line 335
    iget-object p3, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->a:Lv/VDraweeView;

    .line 336
    .line 337
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 338
    .line 339
    .line 340
    move-result-object p4

    .line 341
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 342
    .line 343
    .line 344
    move-result-object p4

    .line 345
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object p4

    .line 349
    const/16 p5, 0x14

    .line 350
    .line 351
    invoke-virtual {p0, p3, p4, p1, p5}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 352
    .line 353
    .line 354
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->c:Landroid/widget/LinearLayout;

    .line 355
    .line 356
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 357
    .line 358
    .line 359
    move-result p0

    .line 360
    if-eqz p0, :cond_8

    .line 361
    .line 362
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->d:Lv/VImage;

    .line 363
    .line 364
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 365
    .line 366
    .line 367
    :cond_8
    :goto_3
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->f:Lv/VImage;

    .line 368
    .line 369
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 370
    .line 371
    .line 372
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->e:Lv/VImage;

    .line 373
    .line 374
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 375
    .line 376
    .line 377
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 378
    .line 379
    .line 380
    move-result p0

    .line 381
    if-eqz p0, :cond_9

    .line 382
    .line 383
    invoke-static {p8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 384
    .line 385
    .line 386
    move-result p0

    .line 387
    if-eqz p0, :cond_9

    .line 388
    .line 389
    invoke-static {p9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result p0

    .line 393
    if-eqz p0, :cond_9

    .line 394
    .line 395
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g:Lv/VImage;

    .line 396
    .line 397
    invoke-virtual {p0, p6}, Landroid/view/View;->setVisibility(I)V

    .line 398
    .line 399
    .line 400
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->h:Lv/VImage;

    .line 401
    .line 402
    invoke-virtual {p0, p6}, Landroid/view/View;->setVisibility(I)V

    .line 403
    .line 404
    .line 405
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g:Lv/VImage;

    .line 406
    .line 407
    new-instance p1, Ll/tkr;

    .line 408
    .line 409
    invoke-direct {p1, p8}, Ll/tkr;-><init>(Ll/x20;)V

    .line 410
    .line 411
    .line 412
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 413
    .line 414
    .line 415
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->h:Lv/VImage;

    .line 416
    .line 417
    new-instance p1, Ll/ukr;

    .line 418
    .line 419
    invoke-direct {p1, p9}, Ll/ukr;-><init>(Ll/x20;)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 423
    .line 424
    .line 425
    :cond_9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 426
    .line 427
    .line 428
    move-result-object p0

    .line 429
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->O()Z

    .line 434
    .line 435
    .line 436
    move-result p0

    .line 437
    if-eqz p0, :cond_b

    .line 438
    .line 439
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 440
    .line 441
    .line 442
    move-result p0

    .line 443
    iget-object p1, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->d:Lv/VImage;

    .line 444
    .line 445
    if-eqz p0, :cond_a

    .line 446
    .line 447
    sget p0, Ll/gbc0;->v5:I

    .line 448
    .line 449
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 450
    .line 451
    .line 452
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->d:Lv/VImage;

    .line 453
    .line 454
    invoke-virtual {p0, p6}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 455
    .line 456
    .line 457
    return-void

    .line 458
    :cond_a
    sget p0, Ll/gbc0;->k6:I

    .line 459
    .line 460
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 461
    .line 462
    .line 463
    :cond_b
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    sget v0, Ll/gbc0;->i6:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->p(I)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 9
    .line 10
    .line 11
    sget v1, Ll/qa00;->h:I

    .line 12
    .line 13
    int-to-float v1, v1

    .line 14
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->a:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ll/wlj;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->a:Lv/VDraweeView;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, -0x1

    .line 35
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->a:Lv/VDraweeView;

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->i:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    const/16 v1, 0x8

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->n:Landroid/widget/FrameLayout;

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 58
    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {v3, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->l(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    const/high16 v4, 0x42000000    # 32.0f

    .line 81
    .line 82
    const/4 v5, 0x1

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    if-nez v3, :cond_0

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->t:Lv/VLinear_FillerMeasure;

    .line 89
    .line 90
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->o:Lv/VText;

    .line 94
    .line 95
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->p:Lv/VLinear_FillerMeasure;

    .line 103
    .line 104
    const/high16 v3, 0x42600000    # 56.0f

    .line 105
    .line 106
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 111
    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->o:Lv/VText;

    .line 115
    .line 116
    const/high16 v6, 0x41000000    # 8.0f

    .line 117
    .line 118
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    invoke-static {v3, v6}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 123
    .line 124
    .line 125
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->p:Lv/VLinear_FillerMeasure;

    .line 126
    .line 127
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    invoke-static {v3, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 132
    .line 133
    .line 134
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->t:Lv/VLinear_FillerMeasure;

    .line 135
    .line 136
    invoke-static {v3, v5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->u:Lv/VText;

    .line 140
    .line 141
    if-nez v0, :cond_2

    .line 142
    .line 143
    invoke-static {v3, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->u:Lv/VText;

    .line 147
    .line 148
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 149
    .line 150
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->n(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/CharSequence;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_2
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->v:Lv/VText;

    .line 162
    .line 163
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-static {v3, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->l(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    if-eqz v3, :cond_3

    .line 176
    .line 177
    const-string v3, ""

    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_3
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->u:Lv/VText;

    .line 181
    .line 182
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    if-eqz v3, :cond_4

    .line 187
    .line 188
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    sget v4, Lcom/p1/mobile/putong/core/member/R$string;->Z0:I

    .line 193
    .line 194
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 195
    .line 196
    .line 197
    move-result-object v6

    .line 198
    invoke-static {v6, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->l(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v6

    .line 202
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v6

    .line 206
    invoke-virtual {v3, v4, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    goto :goto_2

    .line 211
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    invoke-static {v3, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->l(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    :goto_2
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 220
    .line 221
    .line 222
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->q:Lv/VText;

    .line 223
    .line 224
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    sget v4, Lcom/p1/mobile/putong/core/member/R$string;->a1:I

    .line 229
    .line 230
    iget-object v6, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 231
    .line 232
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v6

    .line 236
    invoke-virtual {v3, v4, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    .line 242
    .line 243
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 244
    .line 245
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 246
    .line 247
    invoke-virtual {v0, p1}, Ll/ina;->z3(Lcom/p1/mobile/putong/data/User;)Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->r:Lv/VText;

    .line 252
    .line 253
    if-nez v0, :cond_5

    .line 254
    .line 255
    invoke-static {v3, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 256
    .line 257
    .line 258
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->r:Lv/VText;

    .line 259
    .line 260
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    sget v4, Lcom/p1/mobile/putong/core/member/R$string;->Z0:I

    .line 265
    .line 266
    iget-object v6, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 267
    .line 268
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v6

    .line 272
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v6

    .line 276
    invoke-virtual {v3, v4, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v3

    .line 280
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 281
    .line 282
    .line 283
    goto :goto_4

    .line 284
    :cond_5
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 285
    .line 286
    .line 287
    :goto_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->o:Lv/VText;

    .line 288
    .line 289
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 290
    .line 291
    .line 292
    sget v0, Ll/gbc0;->n2:I

    .line 293
    .line 294
    sget v1, Ll/gbc0;->d6:I

    .line 295
    .line 296
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 297
    .line 298
    .line 299
    move-result v3

    .line 300
    if-eqz v3, :cond_6

    .line 301
    .line 302
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->s:Landroid/widget/ImageView;

    .line 303
    .line 304
    invoke-static {p1, v5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 305
    .line 306
    .line 307
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->s:Landroid/widget/ImageView;

    .line 308
    .line 309
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 310
    .line 311
    .line 312
    return-void

    .line 313
    :cond_6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->boosted()Z

    .line 314
    .line 315
    .line 316
    move-result p1

    .line 317
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->s:Landroid/widget/ImageView;

    .line 318
    .line 319
    if-eqz p1, :cond_7

    .line 320
    .line 321
    invoke-static {v0, v5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 322
    .line 323
    .line 324
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->s:Landroid/widget/ImageView;

    .line 325
    .line 326
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 327
    .line 328
    .line 329
    return-void

    .line 330
    :cond_7
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 331
    .line 332
    .line 333
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    sget v0, Ll/gbc0;->j6:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->p(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final p(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    check-cast v0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eq v0, p1, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void

    .line 38
    :cond_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->g()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method
