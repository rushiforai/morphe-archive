.class public final Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private zza:Ljava/util/List;

.field private zzb:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;->zza:Ljava/util/List;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;->zzb:Z

    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest;
    .registers 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest;

    iget-object v1, p0, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;->zza:Ljava/util/List;

    iget-boolean p0, p0, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;->zzb:Z

    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest;-><init>(Ljava/util/List;Z)V

    return-object v0
.end method

.method public setKeys(Ljava/util/List;)Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;
    .registers 3
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;"
        }
    .end annotation

    const-string v0, "Keys cannot be set to null"

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;->zza:Ljava/util/List;

    return-object p0
.end method

.method public setRetrieveAll(Z)Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;
    .registers 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iput-boolean p1, p0, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;->zzb:Z

    return-object p0
.end method
