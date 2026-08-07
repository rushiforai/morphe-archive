.class public Ll/d19;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public S:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/google/common/base/Optional<",
            "Lcom/p1/mobile/putong/core/data/GrowthMesInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public T:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/google/common/base/Optional<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public U:Ll/dyd0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dyd0<",
            "Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/d19;->R:Lrx/subjects/b;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/d19;->S:Lrx/subjects/a;

    .line 19
    .line 20
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Ll/d19;->T:Lrx/subjects/a;

    .line 29
    .line 30
    new-instance p1, Ll/d19$a;

    .line 31
    .line 32
    const-string v0, "growth_blindbox_info"

    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->new_()Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-direct {p1, p0, v0, v1}, Ll/d19$a;-><init>(Ll/d19;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;)V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Ll/d19;->U:Ll/dyd0;

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic a3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/u09;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/u09;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic b3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/r09;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/r09;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic c3(Ll/d19;Ljava/lang/String;Z)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d19;->J3(Ljava/lang/String;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/ShareId;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic e3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/x09;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/x09;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/y09;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/y09;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static synthetic f3(Lcom/p1/mobile/putong/core/data/CoreGrowthSpamEnvelope;)Lcom/p1/mobile/putong/core/data/GrowthSpamInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreGrowthSpamEnvelope;->data:Lcom/p1/mobile/putong/core/data/GrowthSpamInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/RecallMatch;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic h3(Ll/d19;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Explore;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d19;->I3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Explore;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i3(Ll/d19;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Explore;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d19;->M3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Explore;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/z09;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/z09;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreGrowthSpamEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/a19;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/a19;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method public static synthetic k3(Ll/d19;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/d19;->L3(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l3(Ljava/lang/String;Z)Ll/x1d0;
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
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string p0, "is_exp_field"

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    sget-object p0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "/explore/card/init"

    .line 23
    .line 24
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/a;->Y(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget-object p1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 33
    .line 34
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p1, v0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public static synthetic m3(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
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
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->isRecallUser:Z

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

.method public static synthetic n3(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "cipherUserId"

    .line 7
    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    const-string v3, ""

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-object p0, v3

    .line 18
    :goto_0
    :try_start_1
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    const-string p0, "cipherMomentId"

    .line 22
    .line 23
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move-object p1, v3

    .line 31
    :goto_1
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 32
    .line 33
    .line 34
    :catch_0
    sget-object p0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "/internal/userid"

    .line 41
    .line 42
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/a;->Y(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget-object p1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 51
    .line 52
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {p1, v0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public static synthetic o3()Ll/x1d0;
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
    const-string v1, "/recall/payment_growth/judge"

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
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method public static synthetic p3(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ll/x1d0;
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
    const-string v1, "state"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string p0, "type"

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    const-string p0, "is_exp_field"

    .line 17
    .line 18
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    const-string p0, "id"

    .line 22
    .line 23
    invoke-virtual {v0, p0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    :catch_0
    sget-object p0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "/explore/card/swipe"

    .line 33
    .line 34
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/a;->Y(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget-object p1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 43
    .line 44
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {p1, p2}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public static synthetic q3(Ll/d19;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d19;->O3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r3(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "action"

    .line 7
    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    const-string v3, ""

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-object p0, v3

    .line 18
    :goto_0
    :try_start_1
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    const-string p0, "tracker"

    .line 22
    .line 23
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move-object p1, v3

    .line 31
    :goto_1
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 32
    .line 33
    .line 34
    :catch_0
    sget-object p0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "/growth-match/me"

    .line 41
    .line 42
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget-object p1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 51
    .line 52
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {p1, v0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public static synthetic s3(Ll/d19;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Explore;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d19;->K3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Explore;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t3()Ll/x1d0;
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
    const-string v1, "/picture_force/pop"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->Y(Ljava/lang/String;)Ljava/lang/String;

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
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method public static synthetic u3(Ll/d19;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d19;->Q3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v3(Ll/d19;Ljava/lang/String;Z)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d19;->N3(Ljava/lang/String;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic w3(Ll/d19;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d19;->P3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic x3()Ll/x1d0;
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
    const-string v1, "/recall/message/tab"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->Y(Ljava/lang/String;)Ljava/lang/String;

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
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method public static synthetic y3(Ljava/lang/String;Z)Ll/x1d0;
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
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string p0, "is_exp_field"

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    sget-object p0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "/explore/card/suggest"

    .line 23
    .line 24
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/a;->Y(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget-object p1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 33
    .line 34
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p1, v0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public static bridge synthetic z3(Ll/d19;)Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d19;->A3()Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final A3()Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->new_()Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u76f2\u76d2\u6d3e\u5bf9"

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->title:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "\u6709\u8da3\u7684\u7075\u9b42\u5728\u8fd9\u91cc\u76f8\u9047"

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->subTitle:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public B3(Ljava/lang/String;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Explore;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/w09;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/w09;-><init>(Ll/d19;Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    const-string p1, "card_swipe_init"

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public C3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Explore;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/b19;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v3, p1

    .line 5
    move-object v5, p2

    .line 6
    move-object v2, p3

    .line 7
    move v4, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/b19;-><init>(Ll/d19;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "card_swipe"

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    invoke-virtual {v1, p0, p1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public D3()Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d19;->U:Ll/dyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public E3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/p09;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/p09;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "get_is_back_user"

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
    return-object p0
.end method

.method public F3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/ShareId;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/s09;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/s09;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p1, "share_userid_ab"

    .line 9
    .line 10
    const/4 p2, -0x1

    .line 11
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Ll/t09;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/t09;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public G3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/GrowthSpamInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/e09;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/e09;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "get_spam_info"

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
    return-object p0
.end method

.method public H3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/google/common/base/Optional<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/d19;->T:Lrx/subjects/a;

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

.method public final synthetic I3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Explore;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    .line 16
    .line 17
    return-object p0
.end method

.method public final synthetic J3(Ljava/lang/String;Z)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/o09;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/o09;-><init>(Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance p2, Ll/q09;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Ll/q09;-><init>(Ll/d19;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic K3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Explore;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    .line 16
    .line 17
    return-object p0
.end method

.method public final synthetic L3(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/k09;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Ll/k09;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance p2, Ll/l09;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Ll/l09;-><init>(Ll/d19;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic M3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Explore;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    .line 16
    .line 17
    return-object p0
.end method

.method public final synthetic N3(Ljava/lang/String;Z)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/i09;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/i09;-><init>(Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance p2, Ll/j09;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Ll/j09;-><init>(Ll/d19;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic O3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
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

.method public final synthetic P3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p0, p0, Ll/d19;->S:Lrx/subjects/a;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 35
    .line 36
    return-object p0
.end method

.method public final synthetic Q3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/f09;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/f09;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/g09;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/g09;-><init>(Ll/d19;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/h09;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/h09;-><init>(Ll/d19;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public R3(Ljava/lang/String;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Explore;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/c19;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/c19;-><init>(Ll/d19;Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    const-string p1, "post_explore_cards"

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public S3(Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/d19;->S:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 13
    .line 14
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    iget-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    new-instance v0, Ll/v09;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/v09;-><init>(Ll/d19;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "refresh_growth_mes_info"

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {p1, p0, v1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public T3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/RecallMatch;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/m09;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/m09;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p1, "get_match_status"

    .line 9
    .line 10
    const/4 p2, -0x1

    .line 11
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Ll/n09;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/n09;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method
