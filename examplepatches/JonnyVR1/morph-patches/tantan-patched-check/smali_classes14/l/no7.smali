.class public Ll/no7;
.super Ll/dy6;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/no7$a;
    }
.end annotation


# instance fields
.field public R:D

.field public S:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/core/data/CityCData;",
            ">;"
        }
    .end annotation
.end field

.field public T:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;>;"
        }
    .end annotation
.end field

.field public U:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/no7$a;",
            ">;"
        }
    .end annotation
.end field

.field public V:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/CityCData;",
            "Lcom/p1/mobile/putong/core/data/CityCBanner;",
            ">;>;"
        }
    .end annotation
.end field

.field public final W:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public X:Ll/jxd0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/no7;->R:D

    .line 7
    .line 8
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/no7;->S:Lrx/subjects/b;

    .line 13
    .line 14
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/no7;->T:Lrx/subjects/a;

    .line 19
    .line 20
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/no7;->U:Lrx/subjects/a;

    .line 25
    .line 26
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Ll/no7;->V:Lrx/subjects/a;

    .line 31
    .line 32
    new-instance p1, Ljava/util/HashSet;

    .line 33
    .line 34
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Ll/no7;->W:Ljava/util/HashSet;

    .line 38
    .line 39
    new-instance p1, Ll/jxd0;

    .line 40
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v1, "received_like_conv_exist"

    .line 44
    .line 45
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 64
    .line 65
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Ll/no7;->X:Ll/jxd0;

    .line 69
    .line 70
    return-void
.end method

.method public static synthetic a3(Ll/no7;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/no7;->K3(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method

.method public static synthetic b3(Ll/no7;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/no7;->G3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic c3()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    const-string v1, "fake_conversation_city_centre_enter"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->qf(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic d3(Lcom/p1/mobile/putong/core/data/Greeting;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Greeting;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic f3(Ll/no7;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/no7;->P3(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g3(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/zn7;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/zn7;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Ll/ao7;

    .line 12
    .line 13
    invoke-direct {p0}, Ll/ao7;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic h3(Ll/no7;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/no7;->I3()V

    return-void
.end method

.method public static synthetic i3(Ljava/lang/String;)Ll/x1d0;
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
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic j3(Ll/no7;Lcom/p1/mobile/putong/data/Links;ZJ)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/no7;->M3(Lcom/p1/mobile/putong/data/Links;ZJ)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/CityCConfig;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic l3()Ll/x1d0;
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
    const-string v1, "/city-c-broadcast"

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

.method public static synthetic m3(Ll/no7;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/CityCData;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/no7;->S3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/CityCData;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n3(Ll/no7;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/no7;->R3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o3(Ll/no7;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/no7;->O3(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic p3(Ll/no7;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/no7;->N3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q3(Lcom/p1/mobile/putong/data/Links;ZJ)Ll/x1d0;
    .locals 2

    .line 1
    const-string v0, "/city-c-users?search=suggest"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    new-instance p1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p2, "&"

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, "&limit="

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    const/4 p1, 0x1

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    const/16 p1, 0x14

    .line 62
    .line 63
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p1, "&last_read_time="

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    :goto_1
    sget-object p1, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0
.end method

.method public static synthetic r3(Ll/no7;ZJLcom/p1/mobile/putong/data/Links;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/no7;->L3(ZJLcom/p1/mobile/putong/data/Links;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Greeting;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic t3(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 32
    .line 33
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method

.method public static synthetic u3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v3(Lorg/json/JSONObject;)Ll/x1d0;
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
    const-string v1, "/city-c-buy"

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

.method public static synthetic w3(Ljava/lang/String;)Ll/x1d0;
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
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic x3(Ll/no7;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/no7;->H3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic y3(Ll/no7;Lcom/p1/mobile/putong/core/data/CityCData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/no7;->Q3(Lcom/p1/mobile/putong/core/data/CityCData;)V

    return-void
.end method

.method public static synthetic z3(Ll/no7;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/no7;->J3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public A3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/wn7;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Ll/wn7;-><init>(Ll/no7;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "city_top_buy"

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

.method public B3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/no7;->W:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/CityCConfig;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/city-c-config?search=clean"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    new-instance v1, Ll/yn7;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Ll/yn7;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "city-c-config?search=clean"

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p0, v0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public D3()V
    .locals 1

    .line 1
    new-instance v0, Ll/vn7;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vn7;-><init>(Ll/no7;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public E3(ZJLcom/p1/mobile/putong/data/Links;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/mn7;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move v4, p1

    .line 7
    move-wide v5, p2

    .line 8
    move-object v3, p4

    .line 9
    invoke-direct/range {v1 .. v6}, Ll/mn7;-><init>(Ll/no7;Lcom/p1/mobile/putong/data/Links;ZJ)V

    .line 10
    .line 11
    .line 12
    const-string p0, "get_city_top_greeting"

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {v0, p0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public F3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Greeting;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/no7;->T:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/vg60;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ll/mo7;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/mo7;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public final synthetic G3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    const-string p2, "coin"

    .line 2
    .line 3
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p2, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p2, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/lqb;->k5()Lrx/c;

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/joa;->y4()Lrx/c;

    .line 20
    .line 21
    .line 22
    :goto_0
    invoke-virtual {p0}, Ll/no7;->T3()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic H3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "type"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string v1, "token"

    .line 12
    .line 13
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    new-instance p2, Ll/bo7;

    .line 17
    .line 18
    invoke-direct {p2, v0}, Ll/bo7;-><init>(Lorg/json/JSONObject;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p2}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    new-instance v0, Ll/co7;

    .line 26
    .line 27
    invoke-direct {v0, p0, p1}, Ll/co7;-><init>(Ll/no7;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance p1, Ll/do7;

    .line 35
    .line 36
    invoke-direct {p1}, Ll/do7;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public final synthetic I3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v0, Ll/eo7;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/eo7;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic J3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    new-instance v0, Ll/lo7;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Ll/lo7;-><init>(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-object p1
.end method

.method public final synthetic K3(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/no7;->W:Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

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
    iget-object p0, p0, Ll/no7;->W:Ljava/util/HashSet;

    .line 12
    .line 13
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic L3(ZJLcom/p1/mobile/putong/data/Links;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p5, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    .line 10
    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    new-instance p1, Ll/no7$a;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/no7$a;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result p4

    .line 22
    const/4 v1, 0x0

    .line 23
    if-eqz p4, :cond_0

    .line 24
    .line 25
    const/4 p4, 0x0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    check-cast p4, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 32
    .line 33
    :goto_0
    iput-object p4, p1, Ll/no7$a;->d:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 34
    .line 35
    iget-object p4, p5, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 36
    .line 37
    iget v0, p4, Lcom/p1/mobile/putong/data/Pagination;->total:I

    .line 38
    .line 39
    iput v0, p1, Ll/no7$a;->b:I

    .line 40
    .line 41
    iget-object p4, p4, Lcom/p1/mobile/putong/data/Pagination;->countInfo:Lcom/p1/mobile/putong/data/CountInfo;

    .line 42
    .line 43
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p4

    .line 47
    if-eqz p4, :cond_1

    .line 48
    .line 49
    iget-object p4, p5, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 50
    .line 51
    iget-object p4, p4, Lcom/p1/mobile/putong/data/Pagination;->countInfo:Lcom/p1/mobile/putong/data/CountInfo;

    .line 52
    .line 53
    iget v1, p4, Lcom/p1/mobile/putong/data/CountInfo;->unread:I

    .line 54
    .line 55
    :cond_1
    iput v1, p1, Ll/no7$a;->a:I

    .line 56
    .line 57
    iput-wide p2, p1, Ll/no7$a;->c:J

    .line 58
    .line 59
    iget-object p0, p0, Ll/no7;->U:Lrx/subjects/a;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    goto/16 :goto_2

    .line 65
    .line 66
    :cond_2
    new-instance p1, Lcom/p1/mobile/putong/data/DbLinks;

    .line 67
    .line 68
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 69
    .line 70
    .line 71
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 72
    .line 73
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 74
    .line 75
    iput-object p2, p1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 76
    .line 77
    iget-object p2, p0, Ll/no7;->T:Lrx/subjects/a;

    .line 78
    .line 79
    invoke-virtual {p2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-eqz p2, :cond_3

    .line 88
    .line 89
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-nez p2, :cond_3

    .line 94
    .line 95
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    if-eqz p2, :cond_3

    .line 100
    .line 101
    iget-object p2, p0, Ll/no7;->T:Lrx/subjects/a;

    .line 102
    .line 103
    invoke-virtual {p2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    check-cast p2, Ll/vg60;

    .line 108
    .line 109
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 110
    .line 111
    iget-object p3, p0, Ll/no7;->T:Lrx/subjects/a;

    .line 112
    .line 113
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p3

    .line 117
    check-cast p3, Ll/vg60;

    .line 118
    .line 119
    iget-object p3, p3, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 120
    .line 121
    iget p3, p3, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 122
    .line 123
    iput p3, p1, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 124
    .line 125
    new-instance p3, Ll/nn7;

    .line 126
    .line 127
    invoke-direct {p3, p0, p2}, Ll/nn7;-><init>(Ll/no7;Ljava/util/List;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v0, p3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 131
    .line 132
    .line 133
    new-instance p3, Ll/vg60;

    .line 134
    .line 135
    invoke-direct {p3, p2, p1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 136
    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_3
    iget-object p2, p0, Ll/no7;->T:Lrx/subjects/a;

    .line 140
    .line 141
    invoke-virtual {p2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    if-nez p2, :cond_4

    .line 146
    .line 147
    iget-object p2, p0, Ll/no7;->W:Ljava/util/HashSet;

    .line 148
    .line 149
    invoke-virtual {p2}, Ljava/util/HashSet;->isEmpty()Z

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    if-eqz p2, :cond_4

    .line 154
    .line 155
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    if-eqz p2, :cond_4

    .line 160
    .line 161
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 162
    .line 163
    .line 164
    move-result-object p3

    .line 165
    goto :goto_1

    .line 166
    :cond_4
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 167
    .line 168
    iget p2, p2, Lcom/p1/mobile/putong/data/Pagination;->total:I

    .line 169
    .line 170
    iput p2, p1, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 171
    .line 172
    iget-object p2, p0, Ll/no7;->W:Ljava/util/HashSet;

    .line 173
    .line 174
    new-instance p3, Ll/on7;

    .line 175
    .line 176
    invoke-direct {p3}, Ll/on7;-><init>()V

    .line 177
    .line 178
    .line 179
    invoke-static {v0, p3}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 180
    .line 181
    .line 182
    move-result-object p3

    .line 183
    invoke-virtual {p2, p3}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 184
    .line 185
    .line 186
    new-instance p3, Ll/vg60;

    .line 187
    .line 188
    invoke-direct {p3, v0, p1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 189
    .line 190
    .line 191
    :goto_1
    iget-object p0, p0, Ll/no7;->T:Lrx/subjects/a;

    .line 192
    .line 193
    invoke-virtual {p0, p3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 194
    .line 195
    .line 196
    :goto_2
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 197
    .line 198
    return-object p0
.end method

.method public final synthetic M3(Lcom/p1/mobile/putong/data/Links;ZJ)Lrx/c;
    .locals 7

    .line 1
    new-instance v0, Ll/xn7;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Ll/xn7;-><init>(Lcom/p1/mobile/putong/data/Links;ZJ)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/fo7;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/fo7;-><init>(Ll/no7;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/go7;

    .line 28
    .line 29
    move-object v2, p0

    .line 30
    move-object v6, p1

    .line 31
    move v3, p2

    .line 32
    move-wide v4, p3

    .line 33
    invoke-direct/range {v1 .. v6}, Ll/go7;-><init>(Ll/no7;ZJLcom/p1/mobile/putong/data/Links;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public final synthetic N3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 5
    .line 6
    .line 7
    return-object p1
.end method

.method public final synthetic O3(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/p1/mobile/putong/core/data/CityCData;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move-object v1, v2

    .line 35
    :goto_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 40
    .line 41
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 42
    .line 43
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 54
    .line 55
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 56
    .line 57
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CityCBanner;->text:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-nez v3, :cond_1

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 70
    .line 71
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 72
    .line 73
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CityCBanner;->title:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-nez v3, :cond_1

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 86
    .line 87
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 88
    .line 89
    :cond_1
    iget-object p1, p0, Ll/no7;->V:Lrx/subjects/a;

    .line 90
    .line 91
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->U1:Lrx/subjects/a;

    .line 103
    .line 104
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final synthetic P3(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/io7;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/io7;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/jo7;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/jo7;-><init>(Ll/no7;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/ko7;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/ko7;-><init>(Ll/no7;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public final synthetic Q3(Lcom/p1/mobile/putong/core/data/CityCData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/no7;->S:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic R3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/rn7;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/rn7;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/sn7;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/sn7;-><init>(Ll/no7;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/tn7;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/tn7;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/un7;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/un7;-><init>(Ll/no7;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public final synthetic S3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/CityCData;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 5
    .line 6
    .line 7
    const-class p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/core/data/CityCData;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    return-object v0
.end method

.method public T3()V
    .locals 3

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-double v0, v0

    .line 6
    iput-wide v0, p0, Ll/no7;->R:D

    .line 7
    .line 8
    const-string v0, "/city-c"

    .line 9
    .line 10
    invoke-static {v0}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    new-instance v2, Ll/ho7;

    .line 17
    .line 18
    invoke-direct {v2, p0, v0}, Ll/ho7;-><init>(Ll/no7;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "load_city_centre"

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {v1, p0, v0, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public U3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/CityCData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/qn7;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/qn7;-><init>(Ll/no7;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "poll_city_top_broadcast"

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

.method public V3(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/no7;->T:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/no7;->T:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/vg60;

    .line 20
    .line 21
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 22
    .line 23
    new-instance v1, Ll/pn7;

    .line 24
    .line 25
    invoke-direct {v1, p1}, Ll/pn7;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/jyb;->e0(Ljava/util/List;Ll/qcj;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ll/no7;->T:Lrx/subjects/a;

    .line 35
    .line 36
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/vg60;

    .line 41
    .line 42
    iget-object v0, v0, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 43
    .line 44
    iget v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 45
    .line 46
    add-int/lit8 v1, v1, -0x1

    .line 47
    .line 48
    iput v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 49
    .line 50
    iget-object v0, p0, Ll/no7;->W:Ljava/util/HashSet;

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    iget-object p0, p0, Ll/no7;->W:Ljava/util/HashSet;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method
