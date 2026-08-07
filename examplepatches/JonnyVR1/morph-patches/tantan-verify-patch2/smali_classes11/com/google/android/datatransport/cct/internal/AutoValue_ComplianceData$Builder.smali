.class final Lcom/google/android/datatransport/cct/internal/AutoValue_ComplianceData$Builder;
.super Lcom/google/android/datatransport/cct/internal/ComplianceData$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/datatransport/cct/internal/AutoValue_ComplianceData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private privacyContext:Lcom/google/android/datatransport/cct/internal/ExternalPrivacyContext;

.field private productIdOrigin:Lcom/google/android/datatransport/cct/internal/ComplianceData$ProductIdOrigin;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/datatransport/cct/internal/ComplianceData$Builder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/datatransport/cct/internal/ComplianceData;
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/datatransport/cct/internal/AutoValue_ComplianceData;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/datatransport/cct/internal/AutoValue_ComplianceData$Builder;->privacyContext:Lcom/google/android/datatransport/cct/internal/ExternalPrivacyContext;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/datatransport/cct/internal/AutoValue_ComplianceData$Builder;->productIdOrigin:Lcom/google/android/datatransport/cct/internal/ComplianceData$ProductIdOrigin;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v1, p0, v2}, Lcom/google/android/datatransport/cct/internal/AutoValue_ComplianceData;-><init>(Lcom/google/android/datatransport/cct/internal/ExternalPrivacyContext;Lcom/google/android/datatransport/cct/internal/ComplianceData$ProductIdOrigin;Lcom/google/android/datatransport/cct/internal/AutoValue_ComplianceData$1;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public setPrivacyContext(Lcom/google/android/datatransport/cct/internal/ExternalPrivacyContext;)Lcom/google/android/datatransport/cct/internal/ComplianceData$Builder;
    .locals 0
    .param p1    # Lcom/google/android/datatransport/cct/internal/ExternalPrivacyContext;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/datatransport/cct/internal/AutoValue_ComplianceData$Builder;->privacyContext:Lcom/google/android/datatransport/cct/internal/ExternalPrivacyContext;

    .line 2
    .line 3
    return-object p0
.end method

.method public setProductIdOrigin(Lcom/google/android/datatransport/cct/internal/ComplianceData$ProductIdOrigin;)Lcom/google/android/datatransport/cct/internal/ComplianceData$Builder;
    .locals 0
    .param p1    # Lcom/google/android/datatransport/cct/internal/ComplianceData$ProductIdOrigin;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/datatransport/cct/internal/AutoValue_ComplianceData$Builder;->productIdOrigin:Lcom/google/android/datatransport/cct/internal/ComplianceData$ProductIdOrigin;

    .line 2
    .line 3
    return-object p0
.end method
