.class public final Lcom/google/firebase/remoteconfig/RemoteConfigConstants;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/remoteconfig/RemoteConfigConstants$ExperimentDescriptionFieldKey;,
        Lcom/google/firebase/remoteconfig/RemoteConfigConstants$ResponseFieldKey;,
        Lcom/google/firebase/remoteconfig/RemoteConfigConstants$RequestFieldKey;
    }
.end annotation


# static fields
.field public static final FETCH_REGEX_URL:Ljava/lang/String; = "https://firebaseremoteconfig.googleapis.com/v1/projects/%s/namespaces/%s:fetch"

.field public static final REALTIME_REGEX_URL:Ljava/lang/String; = "https://firebaseremoteconfigrealtime.googleapis.com/v1/projects/%s/namespaces/%s:streamFetchInvalidations"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
