.class public Ll/cv6;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Ljava/lang/String;

.field public final S:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/AIChatAdvice;",
            ">;"
        }
    .end annotation
.end field

.field public T:Ll/xyd0;

.field public U:Ll/xyd0;

.field public V:Ll/fxd0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/cv6;->R:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/cv6;->S:Lrx/subjects/a;

    .line 13
    .line 14
    new-instance p1, Ll/xyd0;

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "ai_chat_analysis_guide_conv_ids_"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ljava/util/HashSet;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-direct {p1, v0, v1}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Ll/cv6;->T:Ll/xyd0;

    .line 47
    .line 48
    new-instance p1, Ll/xyd0;

    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v1, "used_ai_chat_analysis_conv_ids_"

    .line 53
    .line 54
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ljava/util/HashSet;

    .line 73
    .line 74
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-direct {p1, v0, v1}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 78
    .line 79
    .line 80
    iput-object p1, p0, Ll/cv6;->U:Ll/xyd0;

    .line 81
    .line 82
    new-instance p1, Ll/fxd0;

    .line 83
    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string v1, "ai_chat_advice_guide_conv_"

    .line 87
    .line 88
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-direct {p1, v0}, Ll/fxd0;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iput-object p1, p0, Ll/cv6;->V:Ll/fxd0;

    .line 110
    .line 111
    return-void
.end method

.method public static synthetic a3(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/uu6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uu6;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/vu6;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/vu6;-><init>()V

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

.method public static synthetic b3(Ljava/lang/String;Z)Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "method"

    .line 7
    .line 8
    const-string v2, "feedback"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "messageId"

    .line 14
    .line 15
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    const-string p0, "value"

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    const-string p1, "good"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p1, "bad"

    .line 26
    .line 27
    :goto_0
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    :catch_0
    new-instance p0, Ll/wu6;

    .line 31
    .line 32
    invoke-direct {p0, v0}, Ll/wu6;-><init>(Lorg/json/JSONObject;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p1, Ll/xu6;

    .line 40
    .line 41
    invoke-direct {p1}, Ll/xu6;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/AIChatAnalysis;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic d3(Lorg/json/JSONObject;)Ll/x1d0;
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
    const-string v1, "/analysis"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->c(Ljava/lang/String;)Ljava/lang/String;

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

.method public static synthetic e3(Lorg/json/JSONObject;)Ll/x1d0;
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
    const-string v1, "/analysis"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->c(Ljava/lang/String;)Ljava/lang/String;

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

.method public static synthetic f3(Ljava/lang/String;)Ll/x1d0;
    .locals 3

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
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "/show-analysis-guide/"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic h3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/AnalysisGuide;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic i3(Ljava/lang/String;)Lrx/c;
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
    const-string v1, "otherUserId"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    :catch_0
    new-instance p0, Ll/av6;

    .line 12
    .line 13
    invoke-direct {p0, v0}, Ll/av6;-><init>(Lorg/json/JSONObject;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v0, Ll/bv6;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/bv6;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic j3(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;
    .locals 3

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
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "/icebreakings/"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public static synthetic k3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/su6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/su6;-><init>(Ljava/lang/String;Ljava/lang/String;)V

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


# virtual methods
.method public l3(Ljava/lang/String;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/tu6;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/tu6;-><init>(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    const-string p1, "ai_chat_analysisFeedBack"

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
    return-object p0
.end method

.method public m3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/AIChatAnalysis;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/yu6;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/yu6;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p1, "ai_chat_createAnalysis"

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {p0, p1, v1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public n3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "?source="

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p2, ""

    .line 23
    .line 24
    :goto_0
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v1, "ai_chat_getIceBreakings"

    .line 29
    .line 30
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/zu6;

    .line 41
    .line 42
    invoke-direct {v1, p1, p2}, Ll/zu6;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public o3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cv6;->R:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p3(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cv6;->V:Ll/fxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

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
    iget-object v0, p0, Ll/cv6;->V:Ll/fxd0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/core/data/AiChatAdviceConvs;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AiChatAdviceConvs;->adviceConvList:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/cv6;->V:Ll/fxd0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/putong/core/data/AiChatAdviceConvs;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AiChatAdviceConvs;->adviceConvList:Ljava/util/Map;

    .line 38
    .line 39
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ljava/lang/Long;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 46
    .line 47
    .line 48
    move-result-wide p0

    .line 49
    invoke-static {}, Ll/pzi0;->o()J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    invoke-static {p0, p1, v0, v1}, Ll/yab;->C(JJ)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0

    .line 58
    :cond_0
    const/4 p0, 0x0

    .line 59
    return p0
.end method

.method public q3(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cv6;->T:Ll/xyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/HashSet;

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
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public r3(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cv6;->V:Ll/fxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/AiChatAdviceConvs;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AiChatAdviceConvs;->new_()Lcom/p1/mobile/putong/core/data/AiChatAdviceConvs;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/AiChatAdviceConvs;->adviceConvList:Ljava/util/Map;

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    new-instance v1, Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AiChatAdviceConvs;->adviceConvList:Ljava/util/Map;

    .line 25
    .line 26
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/AiChatAdviceConvs;->adviceConvList:Ljava/util/Map;

    .line 27
    .line 28
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/cv6;->V:Ll/fxd0;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public s3(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cv6;->T:Ll/xyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/HashSet;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/cv6;->T:Ll/xyd0;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public t3(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cv6;->U:Ll/xyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/HashSet;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/cv6;->U:Ll/xyd0;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public u3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cv6;->R:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public v3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/AnalysisGuide;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "ai_chat_show_analysis_guide_"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/ru6;

    .line 18
    .line 19
    invoke-direct {v1, p1}, Ll/ru6;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public w3(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cv6;->U:Ll/xyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/HashSet;

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
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method
