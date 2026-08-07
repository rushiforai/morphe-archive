.class public Ll/mge;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mge$a;
    }
.end annotation


# static fields
.field public static c:Ll/mge;


# instance fields
.field public a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/mge$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Banners;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/mge$a;

    .line 5
    .line 6
    const-string v1, "unknown_"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/BannerLoc;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BannerLoc;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-direct {v0, p0, v1, v2}, Ll/mge$a;-><init>(Ll/mge;Lcom/p1/mobile/putong/data/BannerLoc;Z)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/mge;->a:Lrx/subjects/a;

    .line 21
    .line 22
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/mge;->b:Lrx/subjects/a;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Ljava/util/ArrayList;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/BannerLoc;Lcom/p1/mobile/putong/data/Banners;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/BannerContent;->display:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/BannerLoc;Lcom/p1/mobile/putong/data/Banners;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/BannerContent;->display:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/BannerLoc;Ljava/util/List;)Ljava/util/ArrayList;
    .locals 1

    .line 1
    new-instance v0, Ll/kge;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kge;-><init>(Lcom/p1/mobile/putong/data/BannerLoc;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/BannerLoc;Lcom/p1/mobile/putong/data/Banners;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/BannerContent;->display:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic f(Ljava/util/ArrayList;)Lcom/p1/mobile/putong/data/Banners;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/data/Banners;

    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic g(Ljava/lang/StringBuilder;Lcom/p1/mobile/putong/data/BannersItem;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BannersItem;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic h(Ll/mge;Lcom/p1/mobile/putong/data/Banners;Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;Lcom/p1/mobile/android/app/Act;Ll/y20;[I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/mge;->p(Lcom/p1/mobile/putong/data/Banners;Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;Lcom/p1/mobile/android/app/Act;Ll/y20;[I)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/data/Banners;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BannerContent;->banners:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BannerContent;->size:Lcom/p1/mobile/putong/data/BannerSize;

    .line 14
    .line 15
    iget p0, p0, Lcom/p1/mobile/putong/data/BannerSize;->width:I

    .line 16
    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static o()Ll/mge;
    .locals 2

    .line 1
    sget-object v0, Ll/mge;->c:Ll/mge;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/mge;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/mge;->c:Ll/mge;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/mge;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/mge;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/mge;->c:Ll/mge;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/mge;->c:Ll/mge;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public j(Lcom/p1/mobile/putong/data/BannerLoc;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public k(Lcom/p1/mobile/putong/data/BannerLoc;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->f:Ll/qqk;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qqk;->Q:Ljava/util/List;

    .line 4
    .line 5
    new-instance v1, Ll/jge;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ll/jge;-><init>(Lcom/p1/mobile/putong/data/BannerLoc;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/putong/data/Banners;

    .line 26
    .line 27
    invoke-virtual {p0, p1, v1}, Ll/mge;->l(Lcom/p1/mobile/putong/data/Banners;Z)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    return v1
.end method

.method public l(Lcom/p1/mobile/putong/data/Banners;Z)Z
    .locals 7

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BannerContent;->banners:Ljava/util/List;

    .line 9
    .line 10
    new-instance v1, Ll/ige;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/ige;-><init>(Ljava/lang/StringBuilder;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Banners;->action:Lcom/p1/mobile/putong/data/BannerAction;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BannerAction;->red_dot:Lcom/p1/mobile/putong/data/BannerRedDot;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    const-string v1, "once"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x1

    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    const-string v1, "everyday"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    goto/16 :goto_0

    .line 47
    .line 48
    :cond_0
    new-instance v0, Ll/byd0;

    .line 49
    .line 50
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v3, "red_dot_last_show_time_"

    .line 53
    .line 54
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 58
    .line 59
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const-wide/16 v3, 0x0

    .line 89
    .line 90
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-direct {v0, p0, p1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 95
    .line 96
    .line 97
    invoke-static {}, Ll/pzi0;->o()J

    .line 98
    .line 99
    .line 100
    move-result-wide p0

    .line 101
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    check-cast v1, Ljava/lang/Long;

    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 108
    .line 109
    .line 110
    move-result-wide v3

    .line 111
    sub-long v3, p0, v3

    .line 112
    .line 113
    const-wide/32 v5, 0x5265c00

    .line 114
    .line 115
    .line 116
    cmp-long v1, v3, v5

    .line 117
    .line 118
    if-lez v1, :cond_4

    .line 119
    .line 120
    if-eqz p2, :cond_1

    .line 121
    .line 122
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {v0, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    :cond_1
    return v2

    .line 130
    :cond_2
    new-instance v0, Ll/jxd0;

    .line 131
    .line 132
    new-instance v1, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    const-string v3, "red_dot_show_once"

    .line 135
    .line 136
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 140
    .line 141
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-static {p0}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 171
    .line 172
    invoke-direct {v0, p0, p1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    check-cast p0, Ljava/lang/Boolean;

    .line 180
    .line 181
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    if-nez p0, :cond_4

    .line 186
    .line 187
    if-eqz p2, :cond_3

    .line 188
    .line 189
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 190
    .line 191
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    :cond_3
    return v2

    .line 195
    :cond_4
    :goto_0
    const/4 p0, 0x0

    .line 196
    return p0
.end method

.method public m(Lcom/p1/mobile/putong/data/BannerLoc;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->f:Ll/qqk;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qqk;->Q:Ljava/util/List;

    .line 4
    .line 5
    new-instance v0, Ll/lge;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/lge;-><init>(Lcom/p1/mobile/putong/data/BannerLoc;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-lez p1, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/data/Banners;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BannerContent;->banners:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-lez v0, :cond_0

    .line 36
    .line 37
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/p1/mobile/putong/data/Banners;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BannerContent;->banners:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Lcom/p1/mobile/putong/data/BannersItem;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BannersItem;->banner:Ljava/lang/String;

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_0
    const-string p0, ""

    .line 57
    .line 58
    return-object p0
.end method

.method public n(Lcom/p1/mobile/putong/data/BannerLoc;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/BannerLoc;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Banners;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mge;->b:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v0, Ll/ege;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/ege;-><init>(Lcom/p1/mobile/putong/data/BannerLoc;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance p1, Ll/fge;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/fge;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance p1, Ll/gge;

    .line 22
    .line 23
    invoke-direct {p1}, Ll/gge;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance p1, Ll/hge;

    .line 31
    .line 32
    invoke-direct {p1}, Ll/hge;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/data/Banners;Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;Lcom/p1/mobile/android/app/Act;Ll/y20;[I)V
    .locals 4

    .line 1
    new-instance v0, Ll/mge$a;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {p0, p1, v2}, Ll/mge;->l(Lcom/p1/mobile/putong/data/Banners;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    invoke-direct {v0, p0, v1, v3}, Ll/mge$a;-><init>(Ll/mge;Lcom/p1/mobile/putong/data/BannerLoc;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/mge;->a:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 23
    .line 24
    aget p5, p5, v2

    .line 25
    .line 26
    int-to-float p5, p5

    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BannerContent;->size:Lcom/p1/mobile/putong/data/BannerSize;

    .line 30
    .line 31
    iget v1, v0, Lcom/p1/mobile/putong/data/BannerSize;->height:I

    .line 32
    .line 33
    int-to-float v1, v1

    .line 34
    const/high16 v3, 0x3f800000    # 1.0f

    .line 35
    .line 36
    mul-float/2addr v1, v3

    .line 37
    mul-float/2addr p5, v1

    .line 38
    iget v0, v0, Lcom/p1/mobile/putong/data/BannerSize;->width:I

    .line 39
    .line 40
    int-to-float v0, v0

    .line 41
    div-float/2addr p5, v0

    .line 42
    float-to-int p5, p5

    .line 43
    iput p5, p0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 44
    .line 45
    iget-object p5, p1, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 46
    .line 47
    invoke-virtual {p5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p5

    .line 51
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p5}, Ljava/lang/String;->hashCode()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    const/4 v1, -0x1

    .line 59
    sparse-switch v0, :sswitch_data_0

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :sswitch_0
    const-string v0, "conversation"

    .line 64
    .line 65
    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p5

    .line 69
    if-nez p5, :cond_0

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const/4 v1, 0x3

    .line 73
    goto :goto_0

    .line 74
    :sswitch_1
    const-string v0, "leftdrawer_old"

    .line 75
    .line 76
    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p5

    .line 80
    if-nez p5, :cond_1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    const/4 v1, 0x2

    .line 84
    goto :goto_0

    .line 85
    :sswitch_2
    const-string v0, "conversation_old"

    .line 86
    .line 87
    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p5

    .line 91
    if-nez p5, :cond_2

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    const/4 v1, 0x1

    .line 95
    goto :goto_0

    .line 96
    :sswitch_3
    const-string v0, "moment_feed"

    .line 97
    .line 98
    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p5

    .line 102
    if-nez p5, :cond_3

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_3
    move v1, v2

    .line 106
    :goto_0
    const/high16 p5, 0x41200000    # 10.0f

    .line 107
    .line 108
    packed-switch v1, :pswitch_data_0

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :pswitch_0
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 117
    .line 118
    .line 119
    move-result p5

    .line 120
    invoke-virtual {p0, v0, v2, p5, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :pswitch_1
    const/high16 p5, 0x41f80000    # 31.0f

    .line 125
    .line 126
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 131
    .line 132
    .line 133
    move-result p5

    .line 134
    invoke-virtual {p0, v0, v2, p5, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :pswitch_2
    const/high16 p5, 0x41800000    # 16.0f

    .line 139
    .line 140
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 145
    .line 146
    .line 147
    move-result p5

    .line 148
    invoke-virtual {p0, v0, v2, p5, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :pswitch_3
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 165
    .line 166
    .line 167
    move-result p5

    .line 168
    invoke-virtual {p0, v0, v1, v2, p5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 169
    .line 170
    .line 171
    :goto_1
    invoke-virtual {p2, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p2, p3, p1}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Banners;)V

    .line 175
    .line 176
    .line 177
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    if-eqz p0, :cond_4

    .line 182
    .line 183
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->setClickAction(Ll/y20;)V

    .line 184
    .line 185
    .line 186
    :cond_4
    return-void

    .line 187
    :sswitch_data_0
    .sparse-switch
        -0xb83a383 -> :sswitch_3
        -0x6cd3f95 -> :sswitch_2
        0x4f97920 -> :sswitch_1
        0x2c1ddc83 -> :sswitch_0
    .end sparse-switch

    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public q(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/Banners;Ll/y20;)Landroid/view/ViewGroup;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/view/ViewGroup;",
            "Lcom/p1/mobile/putong/data/Banners;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/view/ViewGroup;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->md:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    move-object v4, v0

    .line 14
    check-cast v4, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 15
    .line 16
    invoke-virtual {p2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/dge;

    .line 20
    .line 21
    move-object v2, p0

    .line 22
    move-object v5, p1

    .line 23
    move-object v3, p3

    .line 24
    move-object v6, p4

    .line 25
    invoke-direct/range {v1 .. v6}, Ll/dge;-><init>(Ll/mge;Lcom/p1/mobile/putong/data/Banners;Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v4, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    return-object p2
.end method

.method public r(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/Banners;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/mge;->q(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/Banners;Ll/y20;)Landroid/view/ViewGroup;

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/data/BannerLoc;Lcom/p1/mobile/putong/data/Banners;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/mge;->a:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v1, Ll/mge$a;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, p0, p1, v2}, Ll/mge$a;-><init>(Ll/mge;Lcom/p1/mobile/putong/data/BannerLoc;Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/4 v0, -0x1

    .line 24
    sparse-switch p1, :sswitch_data_0

    .line 25
    .line 26
    .line 27
    :goto_0
    move v2, v0

    .line 28
    goto :goto_1

    .line 29
    :sswitch_0
    const-string p1, "conversation"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v2, 0x4

    .line 39
    goto :goto_1

    .line 40
    :sswitch_1
    const-string p1, "popup"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    const/4 v2, 0x3

    .line 50
    goto :goto_1

    .line 51
    :sswitch_2
    const-string p1, "conversation_old"

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-nez p0, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    const/4 v2, 0x2

    .line 61
    goto :goto_1

    .line 62
    :sswitch_3
    const-string p1, "moment_feed"

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-nez p0, :cond_3

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    const/4 v2, 0x1

    .line 72
    goto :goto_1

    .line 73
    :sswitch_4
    const-string p1, "moment"

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-nez p0, :cond_4

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    :goto_1
    const-string p0, "p_messages_view"

    .line 83
    .line 84
    const-string p1, "e_rightbanner"

    .line 85
    .line 86
    const-string v0, "new"

    .line 87
    .line 88
    const-string v1, "banner_num"

    .line 89
    .line 90
    const-string v3, "UI"

    .line 91
    .line 92
    const-string v4, "number"

    .line 93
    .line 94
    packed-switch v2, :pswitch_data_0

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :pswitch_0
    iget p2, p2, Lcom/p1/mobile/putong/data/Banners;->id:I

    .line 99
    .line 100
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-static {v4, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 113
    .line 114
    .line 115
    move-result-object p3

    .line 116
    invoke-static {v1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    filled-new-array {p2, v0, p3}, [Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-static {p1, p0, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :pswitch_1
    iget p0, p2, Lcom/p1/mobile/putong/data/Banners;->id:I

    .line 129
    .line 130
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    filled-new-array {p0, p1, p2}, [Ll/pf60;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    const-string p1, "e_bulletbox"

    .line 155
    .line 156
    const-string p2, "p_bulletbox"

    .line 157
    .line 158
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :pswitch_2
    iget p2, p2, Lcom/p1/mobile/putong/data/Banners;->id:I

    .line 163
    .line 164
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    invoke-static {v4, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    const-string v0, "old"

    .line 173
    .line 174
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 179
    .line 180
    .line 181
    move-result-object p3

    .line 182
    invoke-static {v1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 183
    .line 184
    .line 185
    move-result-object p3

    .line 186
    filled-new-array {p2, v0, p3}, [Ll/pf60;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    invoke-static {p1, p0, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :pswitch_3
    iget p0, p2, Lcom/p1/mobile/putong/data/Banners;->id:I

    .line 195
    .line 196
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 209
    .line 210
    .line 211
    move-result-object p2

    .line 212
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 213
    .line 214
    .line 215
    move-result-object p2

    .line 216
    filled-new-array {p0, p1, p2}, [Ll/pf60;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    const-string p1, "e_moment_banner"

    .line 221
    .line 222
    const-string p2, "p_moments_view"

    .line 223
    .line 224
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :pswitch_4
    iget p0, p2, Lcom/p1/mobile/putong/data/Banners;->id:I

    .line 229
    .line 230
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 243
    .line 244
    .line 245
    move-result-object p2

    .line 246
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 247
    .line 248
    .line 249
    move-result-object p2

    .line 250
    filled-new-array {p0, p1, p2}, [Ll/pf60;

    .line 251
    .line 252
    .line 253
    move-result-object p0

    .line 254
    const-string p1, "e_explore_banner"

    .line 255
    .line 256
    const-string p2, "p_explore_view"

    .line 257
    .line 258
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    nop

    .line 263
    :sswitch_data_0
    .sparse-switch
        -0x3fb07e00 -> :sswitch_4
        -0xb83a383 -> :sswitch_3
        -0x6cd3f95 -> :sswitch_2
        0x65e70ac -> :sswitch_1
        0x2c1ddc83 -> :sswitch_0
    .end sparse-switch

    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public t(Lcom/p1/mobile/putong/data/Banners;)V
    .locals 7
    .param p1    # Lcom/p1/mobile/putong/data/Banners;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_2

    .line 9
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, -0x1

    .line 23
    sparse-switch v2, :sswitch_data_0

    .line 24
    .line 25
    .line 26
    :goto_0
    move p0, v3

    .line 27
    goto :goto_1

    .line 28
    :sswitch_0
    const-string p0, "conversation"

    .line 29
    .line 30
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p0, 0x3

    .line 38
    goto :goto_1

    .line 39
    :sswitch_1
    const-string p0, "conversation_old"

    .line 40
    .line 41
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 p0, 0x2

    .line 49
    goto :goto_1

    .line 50
    :sswitch_2
    const-string p0, "moment_feed"

    .line 51
    .line 52
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 p0, 0x1

    .line 60
    goto :goto_1

    .line 61
    :sswitch_3
    const-string v2, "moment"

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_4

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    :goto_1
    const-string v1, "p_messages_view"

    .line 71
    .line 72
    const-string v2, "e_rightbanner"

    .line 73
    .line 74
    const-string v3, "new"

    .line 75
    .line 76
    const-string v4, "banner_num"

    .line 77
    .line 78
    const-string v5, "UI"

    .line 79
    .line 80
    const-string v6, "number"

    .line 81
    .line 82
    packed-switch p0, :pswitch_data_0

    .line 83
    .line 84
    .line 85
    :goto_2
    return-void

    .line 86
    :pswitch_0
    iget p0, p1, Lcom/p1/mobile/putong/data/Banners;->id:I

    .line 87
    .line 88
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {v6, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    filled-new-array {p0, p1, v0}, [Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {v2, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :pswitch_1
    iget p0, p1, Lcom/p1/mobile/putong/data/Banners;->id:I

    .line 113
    .line 114
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {v6, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    const-string p1, "old"

    .line 123
    .line 124
    invoke-static {v5, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    filled-new-array {p0, p1, v0}, [Ll/pf60;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {v2, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :pswitch_2
    iget p0, p1, Lcom/p1/mobile/putong/data/Banners;->id:I

    .line 141
    .line 142
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-static {v6, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    filled-new-array {p0, p1, v0}, [Ll/pf60;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    const-string p1, "e_moment_banner"

    .line 163
    .line 164
    const-string v0, "p_moments_view"

    .line 165
    .line 166
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :pswitch_3
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    iget p1, p1, Lcom/p1/mobile/putong/data/Banners;->id:I

    .line 175
    .line 176
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-static {v6, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    filled-new-array {p0, p1, v0}, [Ll/pf60;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    const-string p1, "e_explore_banner"

    .line 193
    .line 194
    const-string v0, "p_explore_view"

    .line 195
    .line 196
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    nop

    .line 201
    :sswitch_data_0
    .sparse-switch
        -0x3fb07e00 -> :sswitch_3
        -0xb83a383 -> :sswitch_2
        -0x6cd3f95 -> :sswitch_1
        0x2c1ddc83 -> :sswitch_0
    .end sparse-switch

    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
