.class public final Ldla;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ly1g;

.field public final b:Ld2g;

.field public final c:Ljava/util/List;

.field public final d:Lcum;

.field public final e:Lola;

.field public final f:Lwla;


# direct methods
.method public constructor <init>(Ly1g;Ld2g;Ljava/util/List;Lcum;Lola;Lwla;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldla;->a:Ly1g;

    iput-object p2, p0, Ldla;->b:Ld2g;

    iput-object p3, p0, Ldla;->c:Ljava/util/List;

    iput-object p4, p0, Ldla;->d:Lcum;

    iput-object p5, p0, Ldla;->e:Lola;

    iput-object p6, p0, Ldla;->f:Lwla;

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 6

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-object v1, p0, Ldla;->a:Ly1g;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    iget-object v3, v1, Ly1g;->a:Ljava/lang/Boolean;

    const-string v4, "supportsTopicSubscription"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v1, Ly1g;->b:Ljava/lang/Boolean;

    const-string v4, "notificationDebug"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v4, "supportsBackNavigation"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v1, Ly1g;->c:Ljava/lang/Boolean;

    const-string v4, "supportsNotificationRequest"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v1, Ly1g;->d:Ljava/lang/Boolean;

    const-string v4, "supportsLocationModes"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v1, Ly1g;->e:Ljava/lang/Boolean;

    const-string v4, "forecastNotification"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, v1, Ly1g;->f:Ljava/lang/Boolean;

    const-string v3, "alertNotification"

    invoke-virtual {v2, v1, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "capabilities"

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Ldla;->b:Ld2g;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    iget-object v3, v1, Ld2g;->a:Ljava/lang/Boolean;

    const-string v4, "trackUserGeoData"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v1, Ld2g;->b:Ljava/lang/Boolean;

    const-string v4, "notificationsEnabled"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, v1, Ld2g;->c:Ljava/lang/Boolean;

    const-string v3, "hasRequestedNotificationPermission"

    invoke-virtual {v2, v1, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "settings"

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lvpb;

    invoke-direct {v1}, Lvpb;-><init>()V

    iget-object v2, p0, Ldla;->c:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_74
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_84

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_74

    :cond_84
    const-string v2, "fcmTopics"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Ldla;->d:Lcum;

    invoke-interface {v1}, Lcum;->a()Lorb;

    move-result-object v1

    const-string v2, "userLocation"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x0

    const-string v2, "Undefined"

    iget-object v3, p0, Ldla;->e:Lola;

    if-eqz v3, :cond_a6

    sget-object v4, Lola;->b:Lola;

    if-eq v3, v4, :cond_a2

    iget-object v3, v3, Lola;->a:Ljava/lang/String;

    goto :goto_a7

    :cond_a2
    invoke-static {v2}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1

    :cond_a6
    move-object v3, v1

    :goto_a7
    const-string v4, "locationMode"

    invoke-virtual {v0, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v3, Lwla;->b:Lwla;

    iget-object p0, p0, Ldla;->f:Lwla;

    if-eq p0, v3, :cond_bf

    iget-object p0, p0, Lwla;->a:Ljava/lang/String;

    const-string v2, "temperatureUnit"

    invoke-virtual {v0, p0, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "hourCycle"

    invoke-virtual {v0, v1, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0

    :cond_bf
    invoke-static {v2}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ldla;

    if-eqz v1, :cond_3e

    check-cast p1, Ldla;

    iget-object v1, p0, Ldla;->a:Ly1g;

    iget-object v2, p1, Ldla;->a:Ly1g;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    iget-object v1, p0, Ldla;->b:Ld2g;

    iget-object v2, p1, Ldla;->b:Ld2g;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    iget-object v1, p0, Ldla;->c:Ljava/util/List;

    iget-object v2, p1, Ldla;->c:Ljava/util/List;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    iget-object v1, p0, Ldla;->d:Lcum;

    iget-object v2, p1, Ldla;->d:Lcum;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    iget-object v1, p0, Ldla;->e:Lola;

    iget-object v2, p1, Ldla;->e:Lola;

    if-ne v1, v2, :cond_3e

    iget-object p0, p0, Ldla;->f:Lwla;

    iget-object p1, p1, Ldla;->f:Lwla;

    if-eq p0, p1, :cond_40

    :cond_3e
    const/4 p0, 0x0

    return p0

    :cond_40
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ldla;->a:Ly1g;

    invoke-virtual {v0}, Ly1g;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ldla;->b:Ld2g;

    invoke-virtual {v2}, Ld2g;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Ldla;->c:Ljava/util/List;

    invoke-static {v2, v1, v0}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object v2, p0, Ldla;->d:Lcum;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Ldla;->e:Lola;

    if-nez v0, :cond_25

    const/4 v0, 0x0

    goto :goto_29

    :cond_25
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_29
    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object p0, p0, Ldla;->f:Lwla;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v2

    mul-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "HostState(capabilities="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ldla;->a:Ly1g;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", settings="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ldla;->b:Ld2g;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", fcmTopics="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ldla;->c:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", userLocation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ldla;->d:Lcum;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", locationMode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ldla;->e:Lola;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", temperatureUnit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ldla;->f:Lwla;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", hourCycle=null)"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
