.class public final Lbla;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lhla;

.field public final b:Lsla;

.field public final c:La2g;


# direct methods
.method public constructor <init>(Lhla;Lsla;La2g;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbla;->a:Lhla;

    iput-object p2, p0, Lbla;->b:Lsla;

    iput-object p3, p0, Lbla;->c:La2g;

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 8

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-object v1, p0, Lbla;->a:Lhla;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    iget-object v3, v1, Lhla;->a:Ljava/lang/String;

    const-string v4, "country"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v1, Lhla;->b:Ljava/lang/String;

    const-string v4, "currentCountry"

    invoke-virtual {v2, v3, v4}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v1, Lhla;->c:Ljla;

    sget-object v4, Ljla;->b:Ljla;

    const/4 v5, 0x0

    const-string v6, "Undefined"

    if-eq v3, v4, :cond_a1

    iget-object v3, v3, Ljla;->a:Ljava/lang/String;

    const-string v4, "product"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v1, Lhla;->d:Llla;

    if-eqz v3, :cond_3c

    sget-object v4, Llla;->b:Llla;

    if-eq v3, v4, :cond_38

    iget-object v3, v3, Llla;->a:Ljava/lang/String;

    goto :goto_3d

    :cond_38
    invoke-static {v6}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v5

    :cond_3c
    move-object v3, v5

    :goto_3d
    const-string v4, "track"

    invoke-virtual {v2, v3, v4}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v1, Lhla;->e:Ljava/lang/String;

    const-string v4, "deviceId"

    invoke-virtual {v2, v3, v4}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v1, Lhla;->f:Ljava/lang/Boolean;

    const-string v4, "esimSupported"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v1, Lhla;->g:Ljava/lang/String;

    const-string v4, "huid"

    invoke-virtual {v2, v3, v4}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, v1, Lhla;->h:Ljava/lang/Boolean;

    const-string v3, "hasSeenOnboarding"

    invoke-virtual {v2, v1, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "host"

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lbla;->b:Lsla;

    if-eqz v1, :cond_73

    new-instance v5, Lorb;

    invoke-direct {v5}, Lorb;-><init>()V

    iget-object v1, v1, Lsla;->a:Ljava/lang/Boolean;

    const-string v2, "trackUserGeoData"

    invoke-virtual {v5, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_73
    const-string v1, "settings"

    invoke-virtual {v0, v5, v1}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    iget-object p0, p0, Lbla;->c:La2g;

    iget-object v2, p0, La2g;->a:Ljava/lang/Boolean;

    const-string v3, "onboarding"

    invoke-virtual {v1, v2, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, p0, La2g;->b:Ljava/lang/Boolean;

    const-string v3, "backButtonAction"

    invoke-virtual {v1, v2, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, p0, La2g;->c:Ljava/lang/Boolean;

    const-string v3, "minipayPayment"

    invoke-virtual {v1, v2, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, La2g;->d:Ljava/lang/Boolean;

    const-string v2, "freeEsimAvailable"

    invoke-virtual {v1, p0, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "featureFlag"

    invoke-virtual {v0, v1, p0}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0

    :cond_a1
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v5
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Lbla;

    if-eqz v0, :cond_26

    check-cast p1, Lbla;

    iget-object v0, p0, Lbla;->a:Lhla;

    iget-object v1, p1, Lbla;->a:Lhla;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object v0, p0, Lbla;->b:Lsla;

    iget-object v1, p1, Lbla;->b:Lsla;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object p0, p0, Lbla;->c:La2g;

    iget-object p1, p1, Lbla;->c:La2g;

    invoke-virtual {p0, p1}, La2g;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    :cond_26
    const/4 p0, 0x0

    return p0

    :cond_28
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lbla;->a:Lhla;

    invoke-virtual {v0}, Lhla;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lbla;->b:Lsla;

    if-nez v1, :cond_e

    const/4 v1, 0x0

    goto :goto_14

    :cond_e
    iget-object v1, v1, Lsla;->a:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_14
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lbla;->c:La2g;

    invoke-virtual {p0}, La2g;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "HostState(host="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lbla;->a:Lhla;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", settings="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbla;->b:Lsla;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", featureFlag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lbla;->c:La2g;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
