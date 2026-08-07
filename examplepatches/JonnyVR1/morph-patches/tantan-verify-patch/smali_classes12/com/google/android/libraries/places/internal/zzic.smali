.class final Lcom/google/android/libraries/places/internal/zzic;
.super Lcom/google/android/libraries/places/internal/zzil;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/libraries/places/internal/zzil<",
        "Ljava/lang/Object;",
        "Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsResponse;",
        ">;"
    }
.end annotation


# instance fields
.field errorMessage:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field predictions:[Lcom/google/android/libraries/places/internal/zzhq;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field status:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzil;-><init>()V

    return-void
.end method
