.class public abstract Lcom/google/android/datatransport/EventContext;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/datatransport/EventContext$Builder;
    }
.end annotation


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

.method public static builder()Lcom/google/android/datatransport/EventContext$Builder;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/datatransport/AutoValue_EventContext$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/datatransport/AutoValue_EventContext$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public abstract getExperimentIdsClear()[B
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getExperimentIdsEncrypted()[B
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getPseudonymousId()Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method
