.class final Lcom/google/android/datatransport/AutoValue_EventContext$Builder;
.super Lcom/google/android/datatransport/EventContext$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/datatransport/AutoValue_EventContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private experimentIdsClear:[B

.field private experimentIdsEncrypted:[B

.field private pseudonymousId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/datatransport/EventContext$Builder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/datatransport/EventContext;
    .locals 4

    .line 1
    new-instance v0, Lcom/google/android/datatransport/AutoValue_EventContext;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/datatransport/AutoValue_EventContext$Builder;->pseudonymousId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/google/android/datatransport/AutoValue_EventContext$Builder;->experimentIdsClear:[B

    .line 6
    .line 7
    iget-object p0, p0, Lcom/google/android/datatransport/AutoValue_EventContext$Builder;->experimentIdsEncrypted:[B

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-direct {v0, v1, v2, p0, v3}, Lcom/google/android/datatransport/AutoValue_EventContext;-><init>(Ljava/lang/String;[B[BLcom/google/android/datatransport/AutoValue_EventContext$1;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public setExperimentIdsClear([B)Lcom/google/android/datatransport/EventContext$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/datatransport/AutoValue_EventContext$Builder;->experimentIdsClear:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public setExperimentIdsEncrypted([B)Lcom/google/android/datatransport/EventContext$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/datatransport/AutoValue_EventContext$Builder;->experimentIdsEncrypted:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public setPseudonymousId(Ljava/lang/String;)Lcom/google/android/datatransport/EventContext$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/datatransport/AutoValue_EventContext$Builder;->pseudonymousId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
