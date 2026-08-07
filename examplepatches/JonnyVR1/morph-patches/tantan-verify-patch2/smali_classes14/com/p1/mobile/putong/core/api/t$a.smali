.class public Lcom/p1/mobile/putong/core/api/t$a;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/t;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;",
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
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "high_risk_monetization"

    .line 14
    .line 15
    const-string v4, "_v17"

    .line 16
    .line 17
    invoke-direct {v1, v3, v4, v2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v2, -0x1

    .line 21
    sget-object v4, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 22
    .line 23
    invoke-direct {v0, v1, v2, v4}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Lcom/p1/mobile/putong/core/api/t$a$a;

    .line 27
    .line 28
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/api/t$a$a;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0, v3, v0, v1}, Ll/mof0;-><init>(Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public B()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;->attributeChannel:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public C()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 22
    .line 23
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/UserTags;->showFemaleAdCardInsert:Z

    .line 24
    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public D()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 22
    .line 23
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/UserTags;->showFemaleAdPopUp:Z

    .line 24
    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public E()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 22
    .line 23
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;->trialDuration:J

    .line 24
    .line 25
    return-wide v0

    .line 26
    :cond_0
    const-wide/32 v0, 0xa8c0

    .line 27
    .line 28
    .line 29
    return-wide v0
.end method

.method public F()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 22
    .line 23
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;->waitDuration:J

    .line 24
    .line 25
    return-wide v0

    .line 26
    :cond_0
    const-wide/32 v0, 0x15180

    .line 27
    .line 28
    .line 29
    return-wide v0
.end method

.method public G()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 22
    .line 23
    iget p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;->huaweiExpStrategy:I

    .line 24
    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, -0x1

    .line 27
    return p0
.end method

.method public H()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 22
    .line 23
    const-string v1, "youthVip"

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 36
    .line 37
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Ljava/util/Map;

    .line 42
    .line 43
    const-string v0, "blindBoxNum"

    .line 44
    .line 45
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-lez v0, :cond_0

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0

    .line 68
    :cond_0
    const/4 p0, 0x5

    .line 69
    return p0
.end method

.method public I()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 22
    .line 23
    const-string v1, "youthVip"

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 36
    .line 37
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Ljava/util/Map;

    .line 42
    .line 43
    const-string v0, "seekPartnerNum"

    .line 44
    .line 45
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-lez v0, :cond_0

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0

    .line 68
    :cond_0
    const/16 p0, 0xa

    .line 69
    .line 70
    return p0
.end method

.method public J()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;->guideBoostMode:Lcom/p1/mobile/putong/core/data/GuideBoostMode;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;->guideBoostMode:Lcom/p1/mobile/putong/core/data/GuideBoostMode;

    .line 34
    .line 35
    const-string v0, "swipe"

    .line 36
    .line 37
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method public K()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;->guideBoostMode:Lcom/p1/mobile/putong/core/data/GuideBoostMode;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;->guideBoostMode:Lcom/p1/mobile/putong/core/data/GuideBoostMode;

    .line 34
    .line 35
    const-string v0, "pop"

    .line 36
    .line 37
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method public L()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 22
    .line 23
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;->crowdSvip:Z

    .line 24
    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public M()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 22
    .line 23
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/UserTags;->liveBigR:Z

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public N()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 22
    .line 23
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/UserTags;->showODiamondBanner:Z

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public O()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showIndexNearbyTab:Z

    .line 14
    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public z()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/mof0;->z()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
