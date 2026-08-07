.class public Lcom/p1/mobile/putong/api/api/FacebookApi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;
    }
.end annotation


# static fields
.field public static final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lrx/c;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/vg60<",
            "Ll/ewi;",
            ">;>;"
        }
    .end annotation
.end field

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const-string v4, "email"

    .line 2
    .line 3
    const-string v5, "user_gender"

    .line 4
    .line 5
    const-string v0, "user_birthday"

    .line 6
    .line 7
    const-string v1, "user_hometown"

    .line 8
    .line 9
    const-string v2, "user_photos"

    .line 10
    .line 11
    const-string v3, "user_location"

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Lcom/p1/mobile/putong/api/api/FacebookApi;->d:Ljava/util/List;

    .line 22
    .line 23
    const-string v0, "user_photos"

    .line 24
    .line 25
    filled-new-array {v0}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Lcom/p1/mobile/putong/api/api/FacebookApi;->e:Ljava/util/List;

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->a:Ljava/util/Map;

    .line 10
    .line 11
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->b:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->c:Lrx/subjects/a;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/api/api/FacebookApi;ZLl/vg60;Lcom/p1/mobile/putong/data/FBPictures;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/api/api/FacebookApi;->s(ZLl/vg60;Lcom/p1/mobile/putong/data/FBPictures;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/tantanapp/common/data/JsonAdapter;Ll/y20;Ljava/lang/String;Landroid/os/Bundle;Ll/y20;Lcom/facebook/GraphResponse;)V
    .locals 6

    .line 1
    const-string v0, "facebook request success : "

    .line 2
    .line 3
    invoke-virtual {p5}, Lcom/facebook/GraphResponse;->b()Lcom/facebook/FacebookRequestError;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "], exception : "

    .line 8
    .line 9
    const-string v3, "facebook request error : "

    .line 10
    .line 11
    const-string v4, ", params = ["

    .line 12
    .line 13
    const-string v5, "[common][network]"

    .line 14
    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {p5}, Lcom/facebook/GraphResponse;->e()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p5

    .line 21
    invoke-virtual {p0, p5}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catch_0
    move-exception p0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string p1, "]"

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {v5, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    if-eqz p4, :cond_1

    .line 64
    .line 65
    invoke-interface {p4, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_1
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/FacebookApi;->m(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {v5, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_2
    if-eqz p4, :cond_3

    .line 105
    .line 106
    new-instance p0, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;

    .line 107
    .line 108
    invoke-direct {p0}, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p5}, Lcom/facebook/GraphResponse;->b()Lcom/facebook/FacebookRequestError;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iput-object p1, p0, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;->error:Lcom/facebook/FacebookRequestError;

    .line 116
    .line 117
    invoke-interface {p4, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p5}, Lcom/facebook/GraphResponse;->b()Lcom/facebook/FacebookRequestError;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-static {v5, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/api/api/FacebookApi;Lcom/tantanapp/common/data/JsonAdapter;Lrx/subjects/a;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/GraphResponse;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/api/api/FacebookApi;->o(Lcom/tantanapp/common/data/JsonAdapter;Lrx/subjects/a;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/GraphResponse;)V

    return-void
.end method

.method public static synthetic d(Ll/ewi;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ewi;->c:Ll/vg60;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Ll/y20;Lcom/facebook/e;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/api/api/FacebookApi;ZLcom/p1/mobile/putong/data/FBAlbums;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/api/api/FacebookApi;->q(ZLcom/p1/mobile/putong/data/FBAlbums;)V

    return-void
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/FacebookApi;->m(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Ll/y20;Lcom/p1/mobile/putong/data/FBPicture;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/data/FBPicture;->thumbnail:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 9
    .line 10
    const-string p1, "image/*"

    .line 11
    .line 12
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 13
    .line 14
    const-string p1, "raw"

    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/api/api/FacebookApi;ZLcom/p1/mobile/putong/data/FBAlbums;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/api/api/FacebookApi;->r(ZLcom/p1/mobile/putong/data/FBAlbums;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/api/api/FacebookApi;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->n(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/api/api/FacebookApi;Lcom/p1/mobile/putong/data/FBAlbums;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->p(Lcom/p1/mobile/putong/data/FBAlbums;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static m(Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    instance-of v0, p0, Lcom/facebook/FacebookAuthorizationException;

    .line 2
    .line 3
    const-string v1, "message"

    .line 4
    .line 5
    const-string v2, "code"

    .line 6
    .line 7
    const-string v3, "fb_api_error"

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/facebook/AccessToken;->d()Lcom/facebook/AccessToken;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/z0w;->u()V

    .line 22
    .line 23
    .line 24
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v4, "(-1001)"

    .line 37
    .line 38
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const-string v0, "-1001"

    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    filled-new-array {v2, v0, v1, v4}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v3, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    instance-of v0, p0, Lcom/facebook/FacebookException;

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v4, "(-1002)"

    .line 79
    .line 80
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    const-string v0, "-1002"

    .line 91
    .line 92
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    filled-new-array {v2, v0, v1, v4}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v3, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string v4, "(-1003)"

    .line 117
    .line 118
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    const-string v0, "-1003"

    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    filled-new-array {v2, v0, v1, v4}, [Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-static {v3, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    :goto_0
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;

    .line 142
    .line 143
    if-eqz v0, :cond_6

    .line 144
    .line 145
    check-cast p0, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;

    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;->error:Lcom/facebook/FacebookRequestError;

    .line 148
    .line 149
    invoke-virtual {v0}, Lcom/facebook/FacebookRequestError;->b()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    sget v4, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;->TOKEN_EXPIRED:I

    .line 154
    .line 155
    if-eq v0, v4, :cond_4

    .line 156
    .line 157
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;->error:Lcom/facebook/FacebookRequestError;

    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/facebook/FacebookRequestError;->b()I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    sget v4, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;->PERMISSION_DENIED:I

    .line 164
    .line 165
    if-ne v0, v4, :cond_3

    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .line 172
    .line 173
    iget-object v4, p0, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;->error:Lcom/facebook/FacebookRequestError;

    .line 174
    .line 175
    invoke-virtual {v4}, Lcom/facebook/FacebookRequestError;->c()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v4

    .line 179
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    const-string v4, "("

    .line 183
    .line 184
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    iget-object v4, p0, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;->error:Lcom/facebook/FacebookRequestError;

    .line 188
    .line 189
    invoke-virtual {v4}, Lcom/facebook/FacebookRequestError;->b()I

    .line 190
    .line 191
    .line 192
    move-result v4

    .line 193
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    const-string v4, ")"

    .line 197
    .line 198
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    goto :goto_2

    .line 209
    :cond_4
    :goto_1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 210
    .line 211
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    if-eqz v0, :cond_5

    .line 216
    .line 217
    sget v0, Lcom/p1/mobile/putong/common/R$string;->B:I

    .line 218
    .line 219
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 220
    .line 221
    .line 222
    const/4 v0, 0x0

    .line 223
    invoke-static {v0, v0}, Ll/uqb0;->Z0(ZZ)Lrx/c;

    .line 224
    .line 225
    .line 226
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;->error:Lcom/facebook/FacebookRequestError;

    .line 227
    .line 228
    invoke-virtual {v0}, Lcom/facebook/FacebookRequestError;->b()I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;->error:Lcom/facebook/FacebookRequestError;

    .line 237
    .line 238
    invoke-virtual {p0}, Lcom/facebook/FacebookRequestError;->c()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    filled-new-array {v2, v0, v1, p0}, [Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-static {v3, p0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 247
    .line 248
    .line 249
    :cond_6
    return-void
.end method


# virtual methods
.method public l()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Ll/ewi;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->b:Lrx/subjects/a;

    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->b:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->b:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ll/vg60;

    .line 23
    .line 24
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    :cond_0
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/api/FacebookApi;->v(Z)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Ll/uxj0;->b:Ll/y20;

    .line 38
    .line 39
    new-instance v2, Ll/jvf;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/jvf;-><init>(Lcom/p1/mobile/putong/api/api/FacebookApi;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->b:Lrx/subjects/a;

    .line 52
    .line 53
    return-object p0
.end method

.method public final synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->m(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic o(Lcom/tantanapp/common/data/JsonAdapter;Lrx/subjects/a;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/GraphResponse;)V
    .locals 6

    .line 1
    const-string v0, "facebook request success : "

    .line 2
    .line 3
    invoke-virtual {p5}, Lcom/facebook/GraphResponse;->b()Lcom/facebook/FacebookRequestError;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "], exception : "

    .line 8
    .line 9
    const-string v3, "facebook request error : "

    .line 10
    .line 11
    const-string v4, ", params = ["

    .line 12
    .line 13
    const-string v5, "[common][network]"

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {p5}, Lcom/facebook/GraphResponse;->e()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p5

    .line 21
    invoke-virtual {p1, p5}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p2, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Lrx/subjects/a;->onCompleted()V

    .line 29
    .line 30
    .line 31
    new-instance p1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p5, "]"

    .line 46
    .line 47
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {v5, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catch_0
    move-exception p1

    .line 59
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, p1}, Lrx/subjects/a;->onError(Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    new-instance p2, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {v5, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;

    .line 98
    .line 99
    invoke-direct {p1}, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p5}, Lcom/facebook/GraphResponse;->b()Lcom/facebook/FacebookRequestError;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p1, Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;->error:Lcom/facebook/FacebookRequestError;

    .line 107
    .line 108
    invoke-virtual {p2, p1}, Lrx/subjects/a;->onError(Ljava/lang/Throwable;)V

    .line 109
    .line 110
    .line 111
    new-instance p1, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p5}, Lcom/facebook/GraphResponse;->b()Lcom/facebook/FacebookRequestError;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-static {v5, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->a:Ljava/util/Map;

    .line 143
    .line 144
    invoke-interface {p0, p3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/data/FBAlbums;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/FBAlbums;->data:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->b:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    if-lez p1, :cond_1

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic q(ZLcom/p1/mobile/putong/data/FBAlbums;)V
    .locals 3

    .line 1
    if-nez p1, :cond_2

    .line 2
    .line 3
    iget-object p1, p2, Lcom/p1/mobile/putong/data/FBAlbums;->data:Ljava/util/List;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/data/FBAlbum;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/data/FBAlbum;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/data/FBAlbums;->data:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/data/FBAlbum;

    .line 31
    .line 32
    iget v2, v1, Lcom/p1/mobile/putong/data/FBAlbum;->count:I

    .line 33
    .line 34
    if-lez v2, :cond_0

    .line 35
    .line 36
    iget-object p1, v1, Lcom/p1/mobile/putong/data/FBAlbum;->id:Ljava/lang/String;

    .line 37
    .line 38
    :cond_1
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/api/api/FacebookApi;->y(Ljava/lang/String;Z)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget-object p1, Ll/uxj0;->b:Ll/y20;

    .line 43
    .line 44
    new-instance p2, Ll/pvf;

    .line 45
    .line 46
    invoke-direct {p2}, Ll/pvf;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    :cond_2
    return-void
.end method

.method public final synthetic r(ZLcom/p1/mobile/putong/data/FBAlbums;)Ll/uxj0;
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->b:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ll/vg60;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    iget-object v0, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 19
    .line 20
    iget-object v1, p2, Lcom/p1/mobile/putong/data/FBAlbums;->paging:Lcom/p1/mobile/putong/data/Links;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/data/FBAlbums;->data:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    :cond_1
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/p1/mobile/putong/data/FBAlbum;

    .line 48
    .line 49
    new-instance v2, Ll/ewi;

    .line 50
    .line 51
    invoke-direct {v2}, Ll/ewi;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v3, v1, Lcom/p1/mobile/putong/data/FBAlbum;->name:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v3, v2, Ll/ewi;->a:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v3, v1, Lcom/p1/mobile/putong/data/FBAlbum;->id:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v3, v2, Ll/ewi;->b:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    iput-object v3, v2, Ll/ewi;->c:Ll/vg60;

    .line 67
    .line 68
    iget v3, v1, Lcom/p1/mobile/putong/data/FBAlbum;->count:I

    .line 69
    .line 70
    iput v3, v2, Ll/ewi;->d:I

    .line 71
    .line 72
    if-lez v3, :cond_1

    .line 73
    .line 74
    iget-object v3, p1, Ll/vg60;->a:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/data/FBAlbum;->cover:Lcom/p1/mobile/putong/data/FBPicture;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/data/FBPicture;->id:Ljava/lang/String;

    .line 82
    .line 83
    new-instance v3, Ll/ovf;

    .line 84
    .line 85
    invoke-direct {v3, v2}, Ll/ovf;-><init>(Ll/ewi;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v1, v3}, Lcom/p1/mobile/putong/api/api/FacebookApi;->x(Ljava/lang/String;Ll/y20;)Lcom/facebook/GraphRequest;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    if-lez p2, :cond_3

    .line 101
    .line 102
    const/4 p2, 0x0

    .line 103
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/api/api/FacebookApi;->w(Ljava/util/List;Ll/y20;)V

    .line 104
    .line 105
    .line 106
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->b:Lrx/subjects/a;

    .line 107
    .line 108
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 112
    .line 113
    return-object p0
.end method

.method public final synthetic s(ZLl/vg60;Lcom/p1/mobile/putong/data/FBPictures;)Ll/uxj0;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    :goto_0
    iget-object p1, p2, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 13
    .line 14
    iget-object v0, p3, Lcom/p1/mobile/putong/data/FBPictures;->paging:Lcom/p1/mobile/putong/data/Links;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p1, p3, Lcom/p1/mobile/putong/data/FBPictures;->data:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    if-eqz p3, :cond_1

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    check-cast p3, Lcom/p1/mobile/putong/data/FBPicture;

    .line 37
    .line 38
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object p3, p3, Lcom/p1/mobile/putong/data/FBPicture;->source:Ljava/lang/String;

    .line 44
    .line 45
    iput-object p3, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 46
    .line 47
    const-string p3, "image/*"

    .line 48
    .line 49
    iput-object p3, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 50
    .line 51
    const-string p3, "raw"

    .line 52
    .line 53
    invoke-static {p3}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    iput-object p3, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 58
    .line 59
    iget-object p3, p2, Ll/vg60;->a:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->c:Lrx/subjects/a;

    .line 66
    .line 67
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 71
    .line 72
    return-object p0
.end method

.method public t()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->c:Lrx/subjects/a;

    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->c:Lrx/subjects/a;

    .line 9
    .line 10
    return-object v0
.end method

.method public u(Ljava/lang/String;Landroid/os/Bundle;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "facebook request url = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", params = ["

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "[common][network]"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->a:Ljava/util/Map;

    .line 29
    .line 30
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->a:Ljava/util/Map;

    .line 41
    .line 42
    invoke-interface {v0, p1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    new-instance v0, Lcom/facebook/GraphRequest;

    .line 46
    .line 47
    invoke-static {}, Lcom/facebook/AccessToken;->d()Lcom/facebook/AccessToken;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    sget-object v9, Lcom/facebook/HttpMethod;->GET:Lcom/facebook/HttpMethod;

    .line 52
    .line 53
    new-instance v1, Ll/kvf;

    .line 54
    .line 55
    move-object v2, p0

    .line 56
    move-object v5, p1

    .line 57
    move-object v6, p2

    .line 58
    move-object v3, p3

    .line 59
    invoke-direct/range {v1 .. v6}, Ll/kvf;-><init>(Lcom/p1/mobile/putong/api/api/FacebookApi;Lcom/tantanapp/common/data/JsonAdapter;Lrx/subjects/a;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 60
    .line 61
    .line 62
    move-object v10, v1

    .line 63
    move-object v8, v6

    .line 64
    move-object v6, v7

    .line 65
    move-object v7, v5

    .line 66
    move-object v5, v0

    .line 67
    invoke-direct/range {v5 .. v10}, Lcom/facebook/GraphRequest;-><init>(Lcom/facebook/AccessToken;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/HttpMethod;Lcom/facebook/GraphRequest$b;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v5}, Lcom/facebook/GraphRequest;->k()Lcom/facebook/d;

    .line 71
    .line 72
    .line 73
    return-object v4

    .line 74
    :cond_0
    move-object v2, p0

    .line 75
    move-object v5, p1

    .line 76
    iget-object p0, v2, Lcom/p1/mobile/putong/api/api/FacebookApi;->a:Ljava/util/Map;

    .line 77
    .line 78
    invoke-interface {p0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    check-cast p0, Lrx/c;

    .line 83
    .line 84
    return-object p0
.end method

.method public v(Z)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/facebook/AccessToken;->d()Lcom/facebook/AccessToken;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/facebook/AccessToken;->o()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "/albums"

    .line 20
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
    new-instance v1, Landroid/os/Bundle;

    .line 29
    .line 30
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v2, "fields"

    .line 34
    .line 35
    const-string v3, "id,name,count,cover_photo"

    .line 36
    .line 37
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const-string v2, "limit"

    .line 41
    .line 42
    const/16 v3, 0x14

    .line 43
    .line 44
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    if-eqz p1, :cond_0

    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->b:Lrx/subjects/a;

    .line 50
    .line 51
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Ll/vg60;

    .line 56
    .line 57
    iget-object v2, v2, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 62
    .line 63
    const-string v3, "after"

    .line 64
    .line 65
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/data/FBAlbums;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 69
    .line 70
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/api/api/FacebookApi;->u(Ljava/lang/String;Landroid/os/Bundle;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/lvf;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/lvf;-><init>(Lcom/p1/mobile/putong/api/api/FacebookApi;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/mvf;

    .line 84
    .line 85
    invoke-direct {v1, p0, p1}, Ll/mvf;-><init>(Lcom/p1/mobile/putong/api/api/FacebookApi;Z)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/nvf;

    .line 93
    .line 94
    invoke-direct {v1, p0, p1}, Ll/nvf;-><init>(Lcom/p1/mobile/putong/api/api/FacebookApi;Z)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0
.end method

.method public w(Ljava/util/List;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/facebook/GraphRequest;",
            ">;",
            "Ll/y20<",
            "Lcom/facebook/e;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/facebook/e;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/facebook/e;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/qvf;

    .line 7
    .line 8
    invoke-direct {p1, p2}, Ll/qvf;-><init>(Ll/y20;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/facebook/e;->f(Lcom/facebook/e$a;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/facebook/e;->j()Lcom/facebook/d;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public x(Ljava/lang/String;Ll/y20;)Lcom/facebook/GraphRequest;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)",
            "Lcom/facebook/GraphRequest;"
        }
    .end annotation

    .line 1
    new-instance v2, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "fields"

    .line 7
    .line 8
    const-string v1, "id,picture"

    .line 9
    .line 10
    invoke-virtual {v2, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v3, Lcom/p1/mobile/putong/data/FBPicture;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v4, Ll/rvf;

    .line 16
    .line 17
    invoke-direct {v4, p2}, Ll/rvf;-><init>(Ll/y20;)V

    .line 18
    .line 19
    .line 20
    const/4 v5, 0x0

    .line 21
    move-object v0, p0

    .line 22
    move-object v1, p1

    .line 23
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/api/api/FacebookApi;->z(Ljava/lang/String;Landroid/os/Bundle;Lcom/tantanapp/common/data/JsonAdapter;Ll/y20;Ll/y20;)Lcom/facebook/GraphRequest;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public y(Ljava/lang/String;Z)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, "/photos"

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Landroid/os/Bundle;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v1, "fields"

    .line 26
    .line 27
    const-string v2, "id,source,picture"

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string v1, "limit"

    .line 33
    .line 34
    const/16 v2, 0x14

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/api/api/FacebookApi;->c:Lrx/subjects/a;

    .line 40
    .line 41
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ll/vg60;

    .line 46
    .line 47
    if-eqz p2, :cond_0

    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    iget-object v2, v1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 52
    .line 53
    iget-object v2, v2, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 56
    .line 57
    const-string v3, "after"

    .line 58
    .line 59
    invoke-virtual {v0, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/data/FBPictures;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 63
    .line 64
    invoke-virtual {p0, p1, v0, v2}, Lcom/p1/mobile/putong/api/api/FacebookApi;->u(Ljava/lang/String;Landroid/os/Bundle;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance v0, Ll/hvf;

    .line 69
    .line 70
    invoke-direct {v0, p0, p2, v1}, Ll/hvf;-><init>(Lcom/p1/mobile/putong/api/api/FacebookApi;ZLl/vg60;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

.method public z(Ljava/lang/String;Landroid/os/Bundle;Lcom/tantanapp/common/data/JsonAdapter;Ll/y20;Ll/y20;)Lcom/facebook/GraphRequest;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;",
            "Ll/y20<",
            "TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lcom/facebook/GraphRequest;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/facebook/GraphRequest;

    .line 2
    .line 3
    move-object v3, p1

    .line 4
    invoke-static {}, Lcom/facebook/AccessToken;->d()Lcom/facebook/AccessToken;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    move-object v2, p4

    .line 9
    sget-object p4, Lcom/facebook/HttpMethod;->GET:Lcom/facebook/HttpMethod;

    .line 10
    .line 11
    new-instance v0, Ll/ivf;

    .line 12
    .line 13
    move-object v4, p2

    .line 14
    move-object v1, p3

    .line 15
    move-object v5, p5

    .line 16
    invoke-direct/range {v0 .. v5}, Ll/ivf;-><init>(Lcom/tantanapp/common/data/JsonAdapter;Ll/y20;Ljava/lang/String;Landroid/os/Bundle;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    move-object p5, v0

    .line 20
    move-object p2, v3

    .line 21
    move-object p3, v4

    .line 22
    invoke-direct/range {p0 .. p5}, Lcom/facebook/GraphRequest;-><init>(Lcom/facebook/AccessToken;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/HttpMethod;Lcom/facebook/GraphRequest$b;)V

    .line 23
    .line 24
    .line 25
    return-object p0
.end method
