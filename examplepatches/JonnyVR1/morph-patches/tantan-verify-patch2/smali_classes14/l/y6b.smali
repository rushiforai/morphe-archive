.class public Ll/y6b;
.super Ll/dy6;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/y6b$a;
    }
.end annotation


# instance fields
.field public final R:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Landroid/util/Pair<",
            "Ljava/util/List<",
            "Ll/y6b$a;",
            ">;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public final S:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;",
            ">;"
        }
    .end annotation
.end field

.field public final T:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final U:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public final V:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final W:Ll/byd0;

.field public final X:Ll/byd0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/y6b;->R:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/y6b;->S:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/y6b;->T:Lrx/subjects/b;

    .line 21
    .line 22
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/y6b;->U:Lrx/subjects/b;

    .line 27
    .line 28
    new-instance p1, Ljava/util/HashSet;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/y6b;->V:Ljava/util/HashSet;

    .line 34
    .line 35
    new-instance p1, Ll/byd0;

    .line 36
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v1, "supreme_tab_show_red_dot_time_"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-wide/16 v1, 0x0

    .line 60
    .line 61
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Ll/y6b;->W:Ll/byd0;

    .line 69
    .line 70
    new-instance p1, Ll/byd0;

    .line 71
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v2, "supreme_tab_show_first_custom_time_"

    .line 75
    .line 76
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 95
    .line 96
    .line 97
    iput-object p1, p0, Ll/y6b;->X:Ll/byd0;

    .line 98
    .line 99
    return-void
.end method

.method private synthetic E3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/y6b;->T:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method private synthetic F3(Ljava/util/List;Ljava/util/List;)Lrx/c;
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lorg/json/JSONArray;

    .line 7
    .line 8
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Lcom/p1/mobile/putong/core/data/Dimensions;

    .line 31
    .line 32
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/Dimensions;->key:Ljava/lang/String;

    .line 33
    .line 34
    iget v3, v3, Lcom/p1/mobile/putong/core/data/Dimensions;->value:I

    .line 35
    .line 36
    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_1

    .line 49
    .line 50
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    check-cast p2, Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    const-string p1, "idealTypes"

    .line 61
    .line 62
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    .line 64
    .line 65
    const-string p1, "dimension"

    .line 66
    .line 67
    invoke-virtual {v0, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    :catch_0
    new-instance p1, Ll/n6b;

    .line 71
    .line 72
    invoke-direct {p1, v0}, Ll/n6b;-><init>(Lorg/json/JSONObject;)V

    .line 73
    .line 74
    .line 75
    invoke-static {p1}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance p2, Ll/o6b;

    .line 80
    .line 81
    invoke-direct {p2, p0}, Ll/o6b;-><init>(Ll/y6b;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0
.end method

.method public static synthetic a3(Ll/y6b;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y6b;->z3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b3(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c3(Ll/y6b;Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/y6b;->B3(Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic d3()Ll/x1d0;
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
    const-string v1, "/privateCustom/setting"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->q2(Ljava/lang/String;)Ljava/lang/String;

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

.method public static synthetic e3(Ll/y6b;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y6b;->A3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f3(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g3(Ll/y6b;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y6b;->E3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h3(Ljava/util/HashMap;Lcom/p1/mobile/putong/core/data/PrivateCustomCard;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PrivateCustomCard;->userId:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PrivateCustomCard;->tags:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic i3()Ll/x1d0;
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
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->p2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static synthetic j3(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/fsb0;->z0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic k3(Lorg/json/JSONObject;)Ll/x1d0;
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
    const-string v1, "/privateCustom/setting"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->q2(Ljava/lang/String;)Ljava/lang/String;

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
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic l3(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m3(Ll/y6b;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y6b;->y3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n3(Ll/y6b;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y6b;->C3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o3(Ll/y6b;Ljava/util/List;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/y6b;->F3(Ljava/util/List;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p3(Ll/y6b;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y6b;->x3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q3(Ll/y6b;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y6b;->D3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method private synthetic x3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/y6b;->S:Lrx/subjects/a;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    .line 23
    .line 24
    return-object p0
.end method


# virtual methods
.method public final synthetic A3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y6b;->U:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic B3(Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y6b;->V:Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object v1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/y6b;->V:Ljava/util/HashSet;

    .line 12
    .line 13
    iget-object v0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/y6b$a;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/y6b$a;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p3, p0, Ll/y6b$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Ljava/util/ArrayList;

    .line 32
    .line 33
    iput-object p1, p0, Ll/y6b$a;->b:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final synthetic C3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/y6b;->V:Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/HashSet;->clear()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    const-class v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 17
    .line 18
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    .line 25
    .line 26
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->cards:Ljava/util/List;

    .line 33
    .line 34
    new-instance v4, Ll/j6b;

    .line 35
    .line 36
    invoke-direct {v4, v1}, Ll/j6b;-><init>(Ljava/util/HashMap;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v3, v4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 40
    .line 41
    .line 42
    iget-boolean v3, v2, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->mock:Z

    .line 43
    .line 44
    if-eqz v3, :cond_0

    .line 45
    .line 46
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->cards:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iget v2, v2, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->total:I

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const/4 v2, -0x1

    .line 57
    :goto_0
    const-class v3, Lcom/p1/mobile/putong/data/CommonData;

    .line 58
    .line 59
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    check-cast v4, Lcom/p1/mobile/putong/data/CommonData;

    .line 64
    .line 65
    iget-object v4, v4, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 66
    .line 67
    new-instance v5, Ll/k6b;

    .line 68
    .line 69
    invoke-direct {v5, p0, v1, v0}, Ll/k6b;-><init>(Ll/y6b;Ljava/util/HashMap;Ljava/util/List;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v4, v5}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->i()Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Lcom/p1/mobile/putong/data/CommonData;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 88
    .line 89
    invoke-static {v1}, Ll/jyb;->E(Ljava/util/List;)Ljava/util/List;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    new-instance v4, Ll/l6b;

    .line 94
    .line 95
    invoke-direct {v4}, Ll/l6b;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-static {v1, v4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-nez p1, :cond_3

    .line 114
    .line 115
    iget-object p0, p0, Ll/y6b;->R:Lrx/subjects/a;

    .line 116
    .line 117
    new-instance p1, Landroid/util/Pair;

    .line 118
    .line 119
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 120
    .line 121
    invoke-direct {p1, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_3
    iget-object p0, p0, Ll/y6b;->R:Lrx/subjects/a;

    .line 129
    .line 130
    if-lez v2, :cond_4

    .line 131
    .line 132
    new-instance p1, Landroid/util/Pair;

    .line 133
    .line 134
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 135
    .line 136
    invoke-direct {p1, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_4
    new-instance p1, Landroid/util/Pair;

    .line 144
    .line 145
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 146
    .line 147
    invoke-direct {p1, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    :goto_1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 154
    .line 155
    return-object p0
.end method

.method public final synthetic D3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/v6b;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/v6b;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/w6b;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/w6b;-><init>(Ll/y6b;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/x6b;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/x6b;-><init>(Ll/y6b;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/i6b;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/i6b;-><init>(Ll/y6b;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public G3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/h6b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/h6b;-><init>(Ll/y6b;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "loadCustomSetting"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public H3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/r6b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/r6b;-><init>(Ll/y6b;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "core_supreme_request"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public I3()Z
    .locals 4

    .line 1
    iget-object p0, p0, Ll/y6b;->X:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long p0, v0, v2

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public J3(Ljava/util/List;Ljava/util/List;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Dimensions;",
            ">;)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/m6b;

    .line 4
    .line 5
    invoke-direct {v1, p0, p2, p1}, Ll/m6b;-><init>(Ll/y6b;Ljava/util/List;Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "privateCustom/setting"

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    invoke-virtual {v0, p0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public K3(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object v0, p0, Ll/y6b;->R:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/util/Pair;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_3

    .line 21
    .line 22
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v1, Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v2, Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_3

    .line 43
    .line 44
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Ll/y6b$a;

    .line 49
    .line 50
    iget-object v3, v3, Ll/y6b$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_1

    .line 59
    .line 60
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 61
    .line 62
    .line 63
    add-int/lit8 v1, v1, -0x1

    .line 64
    .line 65
    iget-object p0, p0, Ll/y6b;->R:Lrx/subjects/a;

    .line 66
    .line 67
    new-instance p1, Landroid/util/Pair;

    .line 68
    .line 69
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast v0, Ljava/util/List;

    .line 72
    .line 73
    if-nez v1, :cond_2

    .line 74
    .line 75
    const/4 v1, 0x1

    .line 76
    goto :goto_0

    .line 77
    :cond_2
    const/4 v1, 0x0

    .line 78
    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-direct {p1, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    :goto_1
    return-void
.end method

.method public L3(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    new-instance p0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "\u60a8\u5df2\u5b8c\u6210\u79c1\u4eba\u5b9a\u5236\uff0c\u662f\u5426\u5e0c\u671b\u66f4\u65b0"

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "\u66f4\u65b0\u5b9a\u5236"

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Ll/s6b;

    .line 19
    .line 20
    invoke-direct {p1, p2}, Ll/s6b;-><init>(Ll/x20;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "\u4e0d\u7528\u4e86"

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance p1, Ll/t6b;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/t6b;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance p1, Ll/u6b;

    .line 43
    .line 44
    invoke-direct {p1}, Ll/u6b;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const/4 p1, 0x1

    .line 52
    invoke-virtual {p0, p1}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public M3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y6b;->U:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public N3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/util/List<",
            "Ll/y6b$a;",
            ">;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y6b;->R:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public r3()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/y6b;->X:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public s3()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/y6b;->W:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public t3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y6b;->S:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public u3()Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y6b;->S:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    .line 8
    .line 9
    return-object p0
.end method

.method public v3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y6b;->T:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public w3(Landroid/content/Context;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/zwk;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "http://m.staging2.p1staff.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/commerce/supreme-partner/index.html?speed=true&_bid=1004554&hideNavigationBar=1&hideNotch=1#/"

    .line 8
    .line 9
    :goto_0
    move-object v2, p0

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const-string p0, "https://m.tantanapp.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/commerce/supreme-partner/index.html?speed=true&_bid=1004554&hideNavigationBar=1&hideNotch=1#/"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :goto_1
    const/4 v4, 0x1

    .line 15
    const/4 v5, 0x0

    .line 16
    const-string v1, ""

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    move-object v0, p1

    .line 20
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic y3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/p6b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/p6b;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/q6b;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/q6b;-><init>(Ll/y6b;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic z3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/api/c;->x3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;Z)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method
