.class public final Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhva;


# instance fields
.field private autoPlayAdBreaks:Z

.field private debugMode:Z

.field private featureFlags:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private transient language:Ljava/lang/String;

.field private numRedirects:I

.field private playerType:Ljava/lang/String;

.field private playerVersion:Ljava/lang/String;

.field private ppid:Ljava/lang/String;

.field private transient restrictToCustomPlayer:Z

.field private sessionId:Ljava/lang/String;

.field private final supportsMultipleVideoDisplayChannels:Z

.field private testingConfig:Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->supportsMultipleVideoDisplayChannels:Z

    const/4 v1, 0x4

    iput v1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->numRedirects:I

    iput-boolean v0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->autoPlayAdBreaks:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->debugMode:Z

    const-string v0, "en"

    iput-object v0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->language:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public doesRestrictToCustomPlayer()Z
    .registers 1

    iget-boolean p0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->restrictToCustomPlayer:Z

    return p0
.end method

.method public getAutoPlayAdBreaks()Z
    .registers 1

    iget-boolean p0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->autoPlayAdBreaks:Z

    return p0
.end method

.method public getFeatureFlags()Ljava/util/Map;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->featureFlags:Ljava/util/Map;

    return-object p0
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->language:Ljava/lang/String;

    return-object p0
.end method

.method public getMaxRedirects()I
    .registers 1

    iget p0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->numRedirects:I

    return p0
.end method

.method public getPlayerType()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->playerType:Ljava/lang/String;

    return-object p0
.end method

.method public getPlayerVersion()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->playerVersion:Ljava/lang/String;

    return-object p0
.end method

.method public getPpid()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->ppid:Ljava/lang/String;

    return-object p0
.end method

.method public getSessionId()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->sessionId:Ljava/lang/String;

    return-object p0
.end method

.method public getTestingConfig()Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->testingConfig:Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;

    return-object p0
.end method

.method public isDebugMode()Z
    .registers 1

    iget-boolean p0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->debugMode:Z

    return p0
.end method

.method public setAutoPlayAdBreaks(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->autoPlayAdBreaks:Z

    return-void
.end method

.method public setDebugMode(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->debugMode:Z

    return-void
.end method

.method public setFeatureFlags(Ljava/util/Map;)V
    .registers 2
    .param p1    # Ljava/util/Map;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->featureFlags:Ljava/util/Map;

    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->language:Ljava/lang/String;

    return-void
.end method

.method public setMaxRedirects(I)V
    .registers 2

    iput p1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->numRedirects:I

    return-void
.end method

.method public setPlayerType(Ljava/lang/String;)V
    .registers 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->playerType:Ljava/lang/String;

    return-void
.end method

.method public setPlayerVersion(Ljava/lang/String;)V
    .registers 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->playerVersion:Ljava/lang/String;

    return-void
.end method

.method public setPpid(Ljava/lang/String;)V
    .registers 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->ppid:Ljava/lang/String;

    return-void
.end method

.method public setRestrictToCustomPlayer(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->restrictToCustomPlayer:Z

    return-void
.end method

.method public setSessionId(Ljava/lang/String;)V
    .registers 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->sessionId:Ljava/lang/String;

    return-void
.end method

.method public setTestingConfig(Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;)V
    .registers 2
    .param p1    # Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->testingConfig:Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 11
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->ppid:Ljava/lang/String;

    iget v1, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->numRedirects:I

    iget-object v2, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->playerType:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->playerVersion:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->language:Ljava/lang/String;

    iget-boolean v5, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->restrictToCustomPlayer:Z

    iget-boolean v6, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->autoPlayAdBreaks:Z

    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;->sessionId:Ljava/lang/String;

    const-string v7, ", numRedirects="

    const-string v8, ", playerType="

    const-string v9, "ImaSdkSettings [ppid="

    invoke-static {v1, v9, v0, v7, v8}, Lsko;->p(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", playerVersion="

    const-string v7, ", language="

    invoke-static {v0, v2, v1, v3, v7}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", restrictToCustom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", autoPlayAdBreaks="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", sessionId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
