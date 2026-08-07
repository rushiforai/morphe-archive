.class public Ll/dkb$l;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dkb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "l"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Lcom/p1/mobile/putong/core/data/RegionRule;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    new-instance v0, Ll/dji;

    .line 2
    .line 3
    new-instance v1, Ll/vod;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "_"

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "region_rule"

    .line 28
    .line 29
    const-string v4, "_2"

    .line 30
    .line 31
    invoke-direct {v1, v3, v4, v2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 v2, -0x1

    .line 35
    sget-object v3, Lcom/p1/mobile/putong/core/data/RegionRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    invoke-direct {v0, v1, v2, v3}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 38
    .line 39
    .line 40
    new-instance v1, Ll/mkb;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/mkb;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v2, "regionRules"

    .line 46
    .line 47
    invoke-direct {p0, v2, v0, v1}, Ll/mof0;-><init>(Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static synthetic B()Ll/x1d0;
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
    const-string v1, "me/region-rules"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->v2(Ljava/lang/String;)Ljava/lang/String;

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

.method public static synthetic C(Lcom/p1/mobile/putong/core/data/RegionRulesEnvelop;)Lcom/p1/mobile/putong/core/data/RegionRule;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RegionRulesEnvelop;->data:Lcom/p1/mobile/putong/core/data/RegionRulesData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RegionRulesData;->regionRules:Ljava/util/List;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/data/RegionRule;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RegionRule;->liveRegionTag:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 13
    .line 14
    sput-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    iget-object v1, v1, Ll/dkb;->a0:Ll/wyd0;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v1, "current live region tag = "

    .line 32
    .line 33
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RegionRule;->liveRegionTag:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "[putong-common][regiontag]"

    .line 50
    .line 51
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-object p0
.end method

.method public static synthetic D()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/nkb;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/nkb;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/RegionRulesEnvelop;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/okb;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/okb;-><init>()V

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
