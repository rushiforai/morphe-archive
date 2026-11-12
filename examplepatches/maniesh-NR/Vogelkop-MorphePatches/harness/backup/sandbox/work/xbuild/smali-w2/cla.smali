.class public final Lcla;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lk2h;

.field public final b:Lb2g;

.field public final c:Lpla;

.field public final d:Lgla;

.field public final e:Lz1g;

.field public final f:Lc2g;

.field public final g:Ljava/lang/String;

.field public final h:Lyf2;


# direct methods
.method public constructor <init>(Lk2h;Lb2g;Lpla;Lgla;Lz1g;Lc2g;Ljava/lang/String;Lyf2;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcla;->a:Lk2h;

    iput-object p2, p0, Lcla;->b:Lb2g;

    iput-object p3, p0, Lcla;->c:Lpla;

    iput-object p4, p0, Lcla;->d:Lgla;

    iput-object p5, p0, Lcla;->e:Lz1g;

    iput-object p6, p0, Lcla;->f:Lc2g;

    iput-object p7, p0, Lcla;->g:Ljava/lang/String;

    iput-object p8, p0, Lcla;->h:Lyf2;

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 12

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    iget-object v2, p0, Lcla;->a:Lk2h;

    iget-object v3, v2, Lk2h;->a:Ljava/lang/String;

    const-string v4, "displayName"

    invoke-virtual {v1, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v3, Lqla;->a:Lqla;

    const-string v3, "OFA"

    const-string v4, "name"

    invoke-virtual {v1, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, v2, Lk2h;->b:Ljava/lang/String;

    const-string v3, "version"

    invoke-virtual {v1, v2, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v2, Lrla;->a:Lrla;

    const-string v2, "beta"

    const-string v3, "track"

    invoke-virtual {v1, v2, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "productInfo"

    invoke-virtual {v0, v1, v2}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const-string v3, "supportsNativeMevAndSev"

    invoke-virtual {v1, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v3, "hostRequiresTournamentToAssociationMigration"

    invoke-virtual {v1, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "capabilities"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    new-instance v2, Lvpb;

    invoke-direct {v2}, Lvpb;-><init>()V

    iget-object v3, p0, Lcla;->c:Lpla;

    iget-object v3, v3, Lpla;->a:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_5b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const-string v5, "sport"

    const-string v6, "id"

    if-eqz v4, :cond_83

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lpcd;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lorb;

    invoke-direct {v7}, Lorb;-><init>()V

    iget-wide v8, v4, Lpcd;->a:J

    invoke-virtual {v7, v8, v9, v6}, Lorb;->o(JLjava/lang/String;)V

    iget-object v4, v4, Lpcd;->b:Lqcd;

    iget-object v4, v4, Lqcd;->a:Ljava/lang/String;

    invoke-virtual {v7, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_5b

    :cond_83
    const-string v3, "match"

    invoke-virtual {v1, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "notificationSubscriptions"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    new-instance v2, Lvpb;

    invoke-direct {v2}, Lvpb;-><init>()V

    iget-object v3, p0, Lcla;->d:Lgla;

    iget-object v4, v3, Lgla;->a:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_9f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_c3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lpcd;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Lorb;

    invoke-direct {v8}, Lorb;-><init>()V

    iget-wide v9, v7, Lpcd;->a:J

    invoke-virtual {v8, v9, v10, v6}, Lorb;->o(JLjava/lang/String;)V

    iget-object v7, v7, Lpcd;->b:Lqcd;

    iget-object v7, v7, Lqcd;->a:Ljava/lang/String;

    invoke-virtual {v8, v7, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_9f

    :cond_c3
    const-string v4, "matches"

    invoke-virtual {v1, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Lvpb;

    invoke-direct {v2}, Lvpb;-><init>()V

    iget-object v4, v3, Lgla;->b:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_d3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_f7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lgdl;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Lorb;

    invoke-direct {v8}, Lorb;-><init>()V

    iget-wide v9, v7, Lgdl;->a:J

    invoke-virtual {v8, v9, v10, v6}, Lorb;->o(JLjava/lang/String;)V

    iget-object v7, v7, Lgdl;->b:Lhdl;

    iget-object v7, v7, Lhdl;->a:Ljava/lang/String;

    invoke-virtual {v8, v7, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_d3

    :cond_f7
    const-string v4, "teams"

    invoke-virtual {v1, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Lvpb;

    invoke-direct {v2}, Lvpb;-><init>()V

    iget-object v3, v3, Lgla;->c:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_107
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_12b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Loxl;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lorb;

    invoke-direct {v7}, Lorb;-><init>()V

    iget-wide v8, v4, Loxl;->a:J

    invoke-virtual {v7, v8, v9, v6}, Lorb;->o(JLjava/lang/String;)V

    iget-object v4, v4, Loxl;->b:Lpxl;

    iget-object v4, v4, Lpxl;->a:Ljava/lang/String;

    invoke-virtual {v7, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_107

    :cond_12b
    const-string v3, "tournaments"

    invoke-virtual {v1, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "following"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v3, "experimentalOnboardingPages"

    invoke-virtual {v1, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "experimentalShortCutsBar"

    invoke-virtual {v1, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, p0, Lcla;->e:Lz1g;

    iget-object v4, v3, Lz1g;->a:Ljava/lang/Boolean;

    const-string v5, "showBasketball"

    invoke-virtual {v1, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "showFollowingMEV"

    invoke-virtual {v1, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const-string v5, "showBasketballSEV"

    invoke-virtual {v1, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "showMatchReport"

    invoke-virtual {v1, v2, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "showAITips"

    invoke-virtual {v1, v2, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "showAudioCommentary"

    invoke-virtual {v1, v2, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, v3, Lz1g;->b:Ljava/lang/Boolean;

    const-string v3, "showCasinoGames"

    invoke-virtual {v1, v2, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "featureFlags"

    invoke-virtual {v0, v1, v2}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    iget-object v2, p0, Lcla;->f:Lc2g;

    iget-object v3, v2, Lc2g;->a:Ljava/lang/Boolean;

    const-string v5, "supportsNotificationSubscription"

    invoke-virtual {v1, v3, v5}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v2, Lc2g;->b:Ljava/lang/Boolean;

    const-string v5, "trackUserGeoData"

    invoke-virtual {v1, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v2, Lc2g;->c:Ljava/lang/Boolean;

    const-string v5, "hasAccessedOnboarding"

    invoke-virtual {v1, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "forceAudioCommentary"

    invoke-virtual {v1, v4, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, v2, Lc2g;->d:Ljava/lang/Boolean;

    const-string v3, "supportsOddsVisibility"

    invoke-virtual {v1, v2, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "settings"

    invoke-virtual {v0, v1, v2}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lcla;->g:Ljava/lang/String;

    const-string v2, "userCountry"

    invoke-virtual {v0, v1, v2}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lcla;->h:Lyf2;

    if-eqz p0, :cond_1c4

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    iget-object v2, p0, Lyf2;->a:Ljava/lang/String;

    const-string v3, "matchId"

    invoke-virtual {v1, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lyf2;->b:Lfla;

    iget-object p0, p0, Lfla;->a:Ljava/lang/String;

    const-string v2, "status"

    invoke-virtual {v1, p0, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1c5

    :cond_1c4
    const/4 v1, 0x0

    :goto_1c5
    const-string p0, "audioCommentary"

    invoke-virtual {v0, v1, p0}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_5a

    instance-of v0, p1, Lcla;

    if-eqz v0, :cond_58

    check-cast p1, Lcla;

    iget-object v0, p0, Lcla;->a:Lk2h;

    iget-object v1, p1, Lcla;->a:Lk2h;

    invoke-virtual {v0, v1}, Lk2h;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lcla;->b:Lb2g;

    iget-object v1, p1, Lcla;->b:Lb2g;

    invoke-virtual {v0, v1}, Lb2g;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lcla;->c:Lpla;

    iget-object v1, p1, Lcla;->c:Lpla;

    invoke-virtual {v0, v1}, Lpla;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lcla;->d:Lgla;

    iget-object v1, p1, Lcla;->d:Lgla;

    invoke-virtual {v0, v1}, Lgla;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lcla;->e:Lz1g;

    iget-object v1, p1, Lcla;->e:Lz1g;

    invoke-virtual {v0, v1}, Lz1g;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lcla;->f:Lc2g;

    iget-object v1, p1, Lcla;->f:Lc2g;

    invoke-virtual {v0, v1}, Lc2g;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lcla;->g:Ljava/lang/String;

    iget-object v1, p1, Lcla;->g:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object p0, p0, Lcla;->h:Lyf2;

    iget-object p1, p1, Lcla;->h:Lyf2;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5a

    :cond_58
    const/4 p0, 0x0

    return p0

    :cond_5a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lcla;->a:Lk2h;

    invoke-virtual {v0}, Lk2h;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcla;->b:Lb2g;

    invoke-virtual {v2}, Lb2g;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lcla;->c:Lpla;

    iget-object v0, v0, Lpla;->a:Ljava/util/List;

    invoke-static {v2, v1, v0}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object v2, p0, Lcla;->d:Lgla;

    invoke-virtual {v2}, Lgla;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lcla;->e:Lz1g;

    invoke-virtual {v0}, Lz1g;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcla;->f:Lc2g;

    invoke-virtual {v2}, Lc2g;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    const/4 v0, 0x0

    iget-object v3, p0, Lcla;->g:Ljava/lang/String;

    if-nez v3, :cond_38

    move v3, v0

    goto :goto_3c

    :cond_38
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_3c
    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-object p0, p0, Lcla;->h:Lyf2;

    if-eqz p0, :cond_46

    invoke-virtual {p0}, Lyf2;->hashCode()I

    move-result v0

    :cond_46
    add-int/2addr v2, v0

    return v2
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "HostState(productInfo="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcla;->a:Lk2h;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", capabilities="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcla;->b:Lb2g;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", notificationSubscriptions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcla;->c:Lpla;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", following="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcla;->d:Lgla;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", featureFlags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcla;->e:Lz1g;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", settings="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcla;->f:Lc2g;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", userCountry="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcla;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", audioCommentary="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcla;->h:Lyf2;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
