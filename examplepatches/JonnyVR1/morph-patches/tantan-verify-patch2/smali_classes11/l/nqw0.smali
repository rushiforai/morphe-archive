.class public final Ll/nqw0;
.super Ll/npw0;
.source "SourceFile"


# instance fields
.field public final c:Lcom/google/android/gms/internal/ads/zzgaa;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/zzgaa;I)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0, p2}, Ll/npw0;-><init>(II)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/nqw0;->c:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nqw0;->c:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
