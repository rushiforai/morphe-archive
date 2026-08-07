.class public Lcom/tantanapp/beatles/v2/data/App;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private appBuild:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "app_build"
    .end annotation
.end field

.field private appIdentifier:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bundle_id"
    .end annotation
.end field

.field private appStartTime:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "app_start_time"
    .end annotation
.end field

.field private appVersion:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "app_version"
    .end annotation
.end field

.field private buildType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "build_type"
    .end annotation
.end field

.field private channel:Ljava/lang/String;

.field private isForeground:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "is_foreground"
    .end annotation
.end field

.field private setUpDuration:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "app_setup_duration"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getAppBuild()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/App;->appBuild:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAppIdentifier()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/App;->appIdentifier:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAppStartTime()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/App;->appStartTime:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAppVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/App;->appVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBuildType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/App;->buildType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getChannel()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/App;->channel:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getForeground()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/App;->isForeground:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSetUpDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/beatles/v2/data/App;->setUpDuration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public setAppBuild(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/App;->appBuild:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setAppIdentifier(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/App;->appIdentifier:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setAppStartTime(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/App;->appStartTime:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setAppVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/App;->appVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setBuildType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/App;->buildType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setChannel(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/App;->channel:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setForeground(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/App;->isForeground:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method

.method public setUpDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/beatles/v2/data/App;->setUpDuration:J

    .line 2
    .line 3
    return-void
.end method
