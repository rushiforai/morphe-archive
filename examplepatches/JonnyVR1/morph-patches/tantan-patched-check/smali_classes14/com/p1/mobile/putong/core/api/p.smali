.class public Lcom/p1/mobile/putong/core/api/p;
.super Ll/dy6;
.source "SourceFile"


# static fields
.field public static final Y:Ljava/lang/String;

.field public static final Z:Ljava/lang/String;

.field public static final a0:Ljava/lang/String;

.field public static final b0:Ljava/lang/String;

.field public static final c0:Ljava/lang/String;

.field public static final d0:Ljava/lang/String;

.field public static final e0:Ljava/lang/String;

.field public static f0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public static g0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public R:Ll/jxd0;

.field public S:Ll/vxd0;

.field public T:Ll/vxd0;

.field public U:Ll/vxd0;

.field public V:Ll/wyd0;

.field public W:Ll/byd0;

.field public X:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Ll/zwk;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "https://m.tantanapp.com"

    .line 6
    .line 7
    const-string v2, "http://m.staging2.p1staff.com"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-object v0, v2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object v0, v1

    .line 14
    :goto_0
    const-string v3, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/movie-moment/index.html?speed=true&_bid=1002786&hideNavigationBar=1&hideNotch=1&cardId=%1$s#/cardPage"

    .line 15
    .line 16
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lcom/p1/mobile/putong/core/api/p;->Y:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {}, Ll/zwk;->e()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    move-object v0, v2

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move-object v0, v1

    .line 31
    :goto_1
    const-string v3, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/movie-moment/index.html?speed=true&_bid=1002786&hideNavigationBar=1&hideNotch=1&userID=%1$s&lid=%2$s#/moviepeoplelist"

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sput-object v0, Lcom/p1/mobile/putong/core/api/p;->Z:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {}, Ll/zwk;->e()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    move-object v0, v2

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move-object v0, v1

    .line 48
    :goto_2
    const-string v3, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/movie-moment/index.html?speed=true&_bid=1002786&hideNavigationBar=1&hideNotch=1#/addMovie"

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Lcom/p1/mobile/putong/core/api/p;->a0:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {}, Ll/zwk;->e()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    move-object v0, v2

    .line 63
    goto :goto_3

    .line 64
    :cond_3
    move-object v0, v1

    .line 65
    :goto_3
    const-string v3, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/movie-moment/index.html?speed=true&_bid=1002786&hideNavigationBar=1&hideNotch=1&userID=%1$s&showChat=%2$s&from=%3$s#/movieProfile"

    .line 66
    .line 67
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    sput-object v0, Lcom/p1/mobile/putong/core/api/p;->b0:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {}, Ll/zwk;->e()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_4

    .line 78
    .line 79
    move-object v0, v2

    .line 80
    goto :goto_4

    .line 81
    :cond_4
    move-object v0, v1

    .line 82
    :goto_4
    const-string v3, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/bookFilmTVSeries/index.html?speed=true&_bid=1005425&hideNavigationBar=1&hideNotch=1#/addMovie"

    .line 83
    .line 84
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    sput-object v0, Lcom/p1/mobile/putong/core/api/p;->c0:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {}, Ll/zwk;->e()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_5

    .line 95
    .line 96
    move-object v0, v2

    .line 97
    goto :goto_5

    .line 98
    :cond_5
    move-object v0, v1

    .line 99
    :goto_5
    const-string v3, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/bookFilmTVSeries/index.html?speed=true&_bid=1005425&hideNavigationBar=1&hideNotch=1&userID=%1$s&showChat=%2$s&from=%3$s#/movieProfile"

    .line 100
    .line 101
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sput-object v0, Lcom/p1/mobile/putong/core/api/p;->d0:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {}, Ll/zwk;->e()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_6

    .line 112
    .line 113
    move-object v1, v2

    .line 114
    :cond_6
    const-string v0, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/tags-movies/index.html?speed=true&_bid=1003556&hideNavigationBar=1&hideNotch=1#/addMovie"

    .line 115
    .line 116
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    sput-object v0, Lcom/p1/mobile/putong/core/api/p;->e0:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    sput-object v0, Lcom/p1/mobile/putong/core/api/p;->f0:Lrx/subjects/a;

    .line 127
    .line 128
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    sput-object v0, Lcom/p1/mobile/putong/core/api/p;->g0:Lrx/subjects/a;

    .line 133
    .line 134
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "chat_bubble_show_"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/p;->R:Ll/jxd0;

    .line 34
    .line 35
    new-instance p1, Ll/vxd0;

    .line 36
    .line 37
    const-string v0, "add_comment_number"

    .line 38
    .line 39
    const/16 v1, 0xc8

    .line 40
    .line 41
    invoke-direct {p1, v0, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/p;->S:Ll/vxd0;

    .line 45
    .line 46
    new-instance p1, Ll/vxd0;

    .line 47
    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v1, "core_add_artwork_click_number_"

    .line 51
    .line 52
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-direct {p1, v0, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/p;->T:Ll/vxd0;

    .line 75
    .line 76
    new-instance p1, Ll/vxd0;

    .line 77
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v2, "core_close_artwork_guide_number_"

    .line 81
    .line 82
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-direct {p1, v0, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 101
    .line 102
    .line 103
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/p;->U:Ll/vxd0;

    .line 104
    .line 105
    new-instance p1, Ll/wyd0;

    .line 106
    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    const-string v1, "core_tag_artwork_show_"

    .line 110
    .line 111
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    const-string v1, ""

    .line 130
    .line 131
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/p;->V:Ll/wyd0;

    .line 135
    .line 136
    new-instance p1, Ll/byd0;

    .line 137
    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    const-string v1, "core_artwork_guide_show_time"

    .line 141
    .line 142
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    const-wide/16 v1, 0x0

    .line 161
    .line 162
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 167
    .line 168
    .line 169
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/p;->W:Ll/byd0;

    .line 170
    .line 171
    return-void
.end method

.method public static synthetic a3()Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/cl9;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cl9;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0
.end method

.method public static synthetic b3(Ljava/lang/String;Lorg/json/JSONObject;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/al9;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/al9;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/core/api/p;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/api/p;->t3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Ljava/lang/String;Lorg/json/JSONObject;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 12
    .line 13
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic e3(Ljava/lang/String;Lorg/json/JSONObject;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/literatures/%s/comments"

    .line 8
    .line 9
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 26
    .line 27
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static synthetic f3(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/el9;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/el9;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/fl9;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/fl9;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/core/api/p;Ljava/lang/String;Lorg/json/JSONObject;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/p;->v3(Ljava/lang/String;Lorg/json/JSONObject;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/CoreData;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    return-object p0
.end method

.method public static synthetic i3(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;->suggestLiteratures:Ljava/util/List;

    .line 12
    .line 13
    return-object p0
.end method

.method public static synthetic j3(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic k3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/oms/me/literatureConfigs"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic l3(Lcom/p1/mobile/putong/core/api/p;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/p;->u3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static p3()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->h()Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;->sr()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/api/p;->c0:Ljava/lang/String;

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/api/p;->a0:Ljava/lang/String;

    .line 19
    .line 20
    return-object v0
.end method

.method public static q3()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->h()Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;->sr()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/api/p;->d0:Ljava/lang/String;

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/api/p;->b0:Ljava/lang/String;

    .line 19
    .line 20
    return-object v0
.end method


# virtual methods
.method public final m3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreData;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_7

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_7

    .line 20
    .line 21
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_7

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :cond_1
    :goto_0
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
    check-cast v0, Lcom/p1/mobile/putong/core/data/Literatures;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_1

    .line 56
    .line 57
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v1, v2, v0}, Ll/dkb;->M9(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Literatures;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    :cond_3
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_5

    .line 76
    .line 77
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 82
    .line 83
    if-nez v0, :cond_4

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 89
    .line 90
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->literatureID:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Ll/dkb;->h7(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Literatures;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-eqz v2, :cond_3

    .line 101
    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Ll/dkb;->g7(Ljava/lang/String;)Ljava/util/List;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_6

    .line 118
    .line 119
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 122
    .line 123
    invoke-virtual {p0, p1, p2}, Ll/dkb;->L9(Ljava/lang/String;Ljava/util/List;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_6
    const/4 v0, 0x0

    .line 128
    invoke-interface {p0, v0, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 129
    .line 130
    .line 131
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 132
    .line 133
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 134
    .line 135
    invoke-virtual {p2, p1, p0}, Ll/dkb;->L9(Ljava/lang/String;Ljava/util/List;)V

    .line 136
    .line 137
    .line 138
    :cond_7
    :goto_2
    return-void
.end method

.method public n3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "/literatures/"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "/comments/"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, "?method="

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    new-instance v3, Lorg/json/JSONObject;

    .line 39
    .line 40
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 41
    .line 42
    .line 43
    :try_start_0
    const-string v0, "interest_level"

    .line 44
    .line 45
    invoke-virtual {v3, v0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception v0

    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    new-instance v4, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v5, "literatures/"

    .line 58
    .line 59
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    new-instance v4, Ll/hl9;

    .line 76
    .line 77
    invoke-direct {v4, v2, v3}, Ll/hl9;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 78
    .line 79
    .line 80
    const/4 v2, -0x1

    .line 81
    invoke-virtual {v0, v1, v2, v4}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/il9;

    .line 86
    .line 87
    move-object v2, p0

    .line 88
    move-object v6, p1

    .line 89
    move-object v4, p2

    .line 90
    move-object v5, p3

    .line 91
    move-object v3, p4

    .line 92
    invoke-direct/range {v1 .. v6}, Ll/il9;-><init>(Lcom/p1/mobile/putong/core/api/p;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0
.end method

.method public o3(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_2

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ll/dkb;->g7(Ljava/lang/String;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_0

    .line 52
    .line 53
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-virtual {p1, p0, v0}, Ll/dkb;->L9(Ljava/lang/String;Ljava/util/List;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void
.end method

.method public r3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/CoreData;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "/literature/"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, "?user_id="

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    new-instance v0, Ll/dl9;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/dl9;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {p1, p0, v1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public s3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/yk9;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/yk9;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "oms/me/literatureConfigs"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {p0, v1, v2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/bl9;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/bl9;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public final synthetic t3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p5, p5, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget p5, p5, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const v0, 0x30d40

    .line 6
    .line 7
    .line 8
    if-ne p5, v0, :cond_2

    .line 9
    .line 10
    const-string p5, "delete"

    .line 11
    .line 12
    invoke-static {p5, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/api/p;->o3(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/api/p;->x3(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    invoke-virtual {p5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0, p4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Th(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 44
    .line 45
    return-object p0
.end method

.method public final synthetic u3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const v1, 0x30d40

    .line 6
    .line 7
    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 11
    .line 12
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 17
    .line 18
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/core/api/p;->m3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreData;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wa(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 48
    .line 49
    return-object p0
.end method

.method public final synthetic v3(Ljava/lang/String;Lorg/json/JSONObject;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/jl9;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/jl9;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    new-instance v0, Ll/zk9;

    .line 19
    .line 20
    invoke-direct {v0, p0, p1}, Ll/zk9;-><init>(Lcom/p1/mobile/putong/core/api/p;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public w3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "interest_level"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move-exception p2

    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "literature/id/comments/"

    .line 19
    .line 20
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    new-instance v1, Ll/gl9;

    .line 31
    .line 32
    invoke-direct {v1, p0, p1, v0}, Ll/gl9;-><init>(Lcom/p1/mobile/putong/core/api/p;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    invoke-virtual {p0, p2, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public x3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_2

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ll/dkb;->g7(Ljava/lang/String;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 44
    .line 45
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_0

    .line 52
    .line 53
    iput-object p2, v2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    invoke-virtual {p1, p0, v0}, Ll/dkb;->L9(Ljava/lang/String;Ljava/util/List;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method
